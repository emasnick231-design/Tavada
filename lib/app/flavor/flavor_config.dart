import 'package:flutter/foundation.dart';

/// Build flavors. Each maps to `lib/main_<flavor>.dart`, an Android
/// `productFlavor` and an iOS scheme of the same name.
enum Flavor { dev, staging, prod }

/// Latency window used by the mock API to feel like a real network.
@immutable
class MockLatency {
  const MockLatency({required this.min, required this.max});

  final Duration min;
  final Duration max;
}

/// Immutable, flavor-specific runtime configuration.
///
/// Values can be overridden at build time, e.g.
/// `flutter run --flavor staging -t lib/main_staging.dart --dart-define=USE_MOCK_API=false`.
@immutable
class FlavorConfig {
  const FlavorConfig._({
    required this.flavor,
    required this.appName,
    required this.apiBaseUrl,
    required this.useMockApi,
    required this.mockLatency,
    required this.mockFailureRate,
    required this.enableNetworkLogs,
    required this.showDebugBanner,
    this.skipOnboarding = false,
  });

  factory FlavorConfig.dev() => const FlavorConfig._(
    flavor: Flavor.dev,
    appName: 'Tavada Dev',
    apiBaseUrl: String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.dev.tavadaeats.com/v1',
    ),
    useMockApi: bool.fromEnvironment('USE_MOCK_API', defaultValue: true),
    mockLatency: MockLatency(
      min: Duration(milliseconds: 450),
      max: Duration(milliseconds: 1100),
    ),
    mockFailureRate: 0,
    enableNetworkLogs: true,
    showDebugBanner: false,
    // Build-time value; looks redundant to the analyzer, but isn't.
    // ignore: avoid_redundant_argument_values
    skipOnboarding: bool.fromEnvironment('SKIP_ONBOARDING'),
  );

  factory FlavorConfig.staging() => const FlavorConfig._(
    flavor: Flavor.staging,
    appName: 'Tavada Stg',
    apiBaseUrl: String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.staging.tavadaeats.com/v1',
    ),
    useMockApi: bool.fromEnvironment('USE_MOCK_API', defaultValue: true),
    // Slower and flakier on purpose so QA exercises loading & error states.
    mockLatency: MockLatency(
      min: Duration(milliseconds: 700),
      max: Duration(milliseconds: 1800),
    ),
    mockFailureRate: 0.08,
    enableNetworkLogs: true,
    showDebugBanner: false,
  );

  factory FlavorConfig.prod() => const FlavorConfig._(
    flavor: Flavor.prod,
    appName: 'Tavada Eats',
    apiBaseUrl: String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://api.tavadaeats.com/v1',
    ),
    // No backend yet: the mock API ships until the real one is live.
    useMockApi: bool.fromEnvironment('USE_MOCK_API', defaultValue: true),
    mockLatency: MockLatency(
      min: Duration(milliseconds: 250),
      max: Duration(milliseconds: 650),
    ),
    mockFailureRate: 0,
    enableNetworkLogs: false,
    showDebugBanner: false,
  );

  final Flavor flavor;
  final String appName;
  final String apiBaseUrl;
  final bool useMockApi;
  final MockLatency mockLatency;

  /// Probability (0..1) that a mock request fails with a 503.
  final double mockFailureRate;
  final bool enableNetworkLogs;
  final bool showDebugBanner;

  /// Dev-only: start as a guest with a demo address (`SKIP_ONBOARDING`).
  final bool skipOnboarding;

  bool get isDev => flavor == Flavor.dev;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProd => flavor == Flavor.prod;
}
