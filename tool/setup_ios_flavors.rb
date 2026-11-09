# frozen_string_literal: true

# Creates iOS build configurations + schemes for each app flavor.
# Idempotent: safe to re-run. Usage: ruby tool/setup_ios_flavors.rb
require 'xcodeproj'
require 'fileutils'

ROOT = File.expand_path('..', __dir__)
PROJECT_PATH = File.join(ROOT, 'ios', 'Runner.xcodeproj')
FLAVORS = {
  'dev' => { bundle_id: 'com.tavadaeats.app.dev', display_name: 'Tavada Dev' },
  'staging' => { bundle_id: 'com.tavadaeats.app.stg', display_name: 'Tavada Stg' },
  'prod' => { bundle_id: 'com.tavadaeats.app', display_name: 'Tavada Eats' }
}.freeze
BASES = { 'Debug' => 'debug', 'Release' => 'release', 'Profile' => 'release' }.freeze

project = Xcodeproj::Project.open(PROJECT_PATH)
flutter_group = project.main_group['Flutter']

def dup_config(project, list, base_name, new_name)
  existing = list.build_configurations.find { |c| c.name == new_name }
  return existing if existing

  base = list.build_configurations.find { |c| c.name == base_name }
  config = project.new(Xcodeproj::Project::Object::XCBuildConfiguration)
  config.name = new_name
  config.build_settings = Marshal.load(Marshal.dump(base.build_settings))
  config.base_configuration_reference = base.base_configuration_reference
  list.build_configurations << config
  config
end

# Base (non-flavored) configs keep working with a sensible display name.
%w[Debug Release].each do |base|
  path = File.join(ROOT, 'ios', 'Flutter', "#{base}.xcconfig")
  content = File.read(path)
  File.write(path, "#{content.rstrip}\nAPP_DISPLAY_NAME=Tavada Eats\n") unless content.include?('APP_DISPLAY_NAME')
end

FLAVORS.each do |flavor, cfg|
  BASES.each do |base, pods_kind|
    name = "#{base}-#{flavor}"
    xcconfig_name = "#{name}.xcconfig"
    xcconfig_path = File.join(ROOT, 'ios', 'Flutter', xcconfig_name)
    File.write(xcconfig_path, <<~XC)
      #include? "Pods/Target Support Files/Pods-Runner/Pods-Runner.#{name.downcase}.xcconfig"
      #include "Generated.xcconfig"

      // Flavor: #{flavor}
      APP_DISPLAY_NAME=#{cfg[:display_name]}
      FLUTTER_FLAVOR=#{flavor}
    XC
    ref_path = "Flutter/#{xcconfig_name}"
    file_ref = flutter_group.files.find { |f| [xcconfig_name, ref_path].include?(f.path) } ||
               flutter_group.new_reference(ref_path)
    file_ref.path = ref_path
    file_ref.name = xcconfig_name
    file_ref.source_tree = '<group>'

    dup_config(project, project.build_configuration_list, base, name)
    project.targets.each do |target|
      config = dup_config(project, target.build_configuration_list, base, name)
      next unless target.name == 'Runner'

      config.base_configuration_reference = file_ref
      config.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = cfg[:bundle_id]
    end
    project.targets.select { |t| t.name == 'RunnerTests' }.each do |t|
      t.build_configuration_list.build_configurations
       .find { |c| c.name == name }
       .build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = "#{cfg[:bundle_id]}.RunnerTests"
    end
    _ = pods_kind
  end
end

# Minimum iOS version for every configuration of every target.
([project] + project.targets).each do |owner|
  owner.build_configuration_list.build_configurations.each do |c|
    c.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
  end
end

# Default (non-flavored) Runner configs use the prod bundle id.
runner = project.targets.find { |t| t.name == 'Runner' }
%w[Debug Release Profile].each do |n|
  runner.build_configuration_list.build_configurations.find { |c| c.name == n }
        .build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = 'com.tavadaeats.app'
end
project.save

# Schemes: one per flavor, cloned from Runner.xcscheme.
schemes_dir = File.join(PROJECT_PATH, 'xcshareddata', 'xcschemes')
template = File.read(File.join(schemes_dir, 'Runner.xcscheme'))
FLAVORS.each_key do |flavor|
  scheme = template
           .gsub(/(<TestAction[^>]*buildConfiguration = ")Debug(")/m, "\\1Debug-#{flavor}\\2")
           .gsub(/(<LaunchAction[^>]*buildConfiguration = ")Debug(")/m, "\\1Debug-#{flavor}\\2")
           .gsub(/(<ProfileAction[^>]*buildConfiguration = ")Profile(")/m, "\\1Profile-#{flavor}\\2")
           .gsub(/(<AnalyzeAction[^>]*buildConfiguration = ")Debug(")/m, "\\1Debug-#{flavor}\\2")
           .gsub(/(<ArchiveAction[^>]*buildConfiguration = ")Release(")/m, "\\1Release-#{flavor}\\2")
  File.write(File.join(schemes_dir, "#{flavor}.xcscheme"), scheme)
end

# Podfile: map every flavored configuration to its build kind.
podfile = File.join(ROOT, 'ios', 'Podfile')
pod = File.read(podfile)
mapping = ["'Debug' => :debug", "'Profile' => :release", "'Release' => :release"]
FLAVORS.each_key do |flavor|
  mapping += ["'Debug-#{flavor}' => :debug", "'Profile-#{flavor}' => :release", "'Release-#{flavor}' => :release"]
end
pod = pod.sub(/project 'Runner', \{[^}]*\}/m, "project 'Runner', {\n  #{mapping.join(",\n  ")},\n}")
pod = pod.sub(/^# platform :ios, '[\d.]+'/, "platform :ios, '15.0'")
unless pod.include?('IPHONEOS_DEPLOYMENT_TARGET')
  pod = pod.sub(/(flutter_additional_ios_build_settings\(target\)\n)/) do
    "#{Regexp.last_match(1)}    target.build_configurations.each do |config|\n" \
    "      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'\n" \
    "    end\n"
  end
end
File.write(podfile, pod)
puts 'iOS flavors configured: ' + FLAVORS.keys.join(', ')
