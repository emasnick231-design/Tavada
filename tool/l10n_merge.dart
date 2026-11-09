// Merges feature-owned ARB fragments into the gen-l10n template files.
//
// Every feature keeps its own strings next to its code:
//   lib/features/<feature>/l10n/<feature>_en.arb
//   lib/features/<feature>/l10n/<feature>_tr.arb
//   lib/core/l10n/core_en.arb (shared/common strings)
//
// This script concatenates them into lib/core/l10n/arb/app_<locale>.arb
// (generated — never edit by hand). It fails on duplicate keys and fills
// missing translations from English so gen-l10n never breaks.
//
// Run via `tool/codegen.sh` (or `dart run tool/l10n_merge.dart`).
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const locales = ['en', 'tr'];
const templateLocale = 'en';
final outDir = Directory('lib/core/l10n/arb');
final fragmentPattern = RegExp(r'[/\\]l10n[/\\]([a-z0-9_]+)_([a-z]{2})\.arb$');

void main() {
  final fragments =
      Directory('lib')
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => fragmentPattern.hasMatch(f.path))
          .where((f) => !f.path.contains('core/l10n/arb'))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path));

  final merged = {
    for (final l in locales) l: <String, Object?>{'@@locale': l},
  };
  final owners = {for (final l in locales) l: <String, String>{}};
  var hasErrors = false;

  for (final file in fragments) {
    final locale = fragmentPattern.firstMatch(file.path)!.group(2)!;
    if (!locales.contains(locale)) continue;
    final Map<String, dynamic> json;
    try {
      json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    } on FormatException catch (e) {
      print('✗ ${file.path}: invalid JSON (${e.message})');
      hasErrors = true;
      continue;
    }
    for (final entry in json.entries) {
      final key = entry.key;
      if (key.startsWith('@@')) continue;
      final isMeta = key.startsWith('@');
      final owner = owners[locale]![key];
      if (!isMeta && owner != null && owner != file.path) {
        print('✗ Duplicate key "$key" in ${file.path} (already in $owner)');
        hasErrors = true;
        continue;
      }
      owners[locale]![key] = file.path;
      merged[locale]![key] = entry.value;
    }
  }

  // Fill missing translations from the template so gen-l10n always succeeds.
  final template = merged[templateLocale]!;
  for (final locale in locales.where((l) => l != templateLocale)) {
    final target = merged[locale]!;
    final missing = template.keys.where(
      (k) => !k.startsWith('@') && !target.containsKey(k),
    );
    for (final key in missing) {
      target[key] = template[key];
    }
    if (missing.isNotEmpty) {
      print('! $locale: ${missing.length} untranslated key(s) fell back to en');
    }
    // Translations only carry messages; metadata lives in the template.
    target.removeWhere((k, _) => k.startsWith('@') && !k.startsWith('@@'));
  }

  if (hasErrors) {
    print('l10n merge failed.');
    exit(1);
  }

  outDir.createSync(recursive: true);
  const encoder = JsonEncoder.withIndent('  ');
  for (final locale in locales) {
    File(
      '${outDir.path}/app_$locale.arb',
    ).writeAsStringSync('${encoder.convert(merged[locale])}\n');
  }
  final count = template.keys.where((k) => !k.startsWith('@')).length;
  print('✓ l10n: merged ${fragments.length} fragments → $count keys');
}
