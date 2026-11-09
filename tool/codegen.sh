#!/usr/bin/env bash
# Runs every code generator in the right order:
#   1. merge feature ARB fragments → lib/core/l10n/arb/app_<locale>.arb
#   2. flutter gen-l10n            → lib/core/l10n/gen/
#   3. build_runner                → *.freezed.dart, *.g.dart, lib/gen/assets.gen.dart
#
# Safe to call concurrently (e.g. from several terminals/agents): runs are
# serialized with a lock directory so build_runner never races itself.
#
# Usage: tool/codegen.sh            (one-off build)
#        tool/codegen.sh --l10n     (only steps 1-2, fast)
set -euo pipefail
cd "$(dirname "$0")/.."

LOCK=".dart_tool/codegen.lock"
mkdir -p .dart_tool

# Break locks left behind by killed processes (older than 10 minutes).
if [ -d "$LOCK" ] && [ -n "$(find "$LOCK" -maxdepth 0 -mmin +10 2>/dev/null)" ]; then
  echo "⚠︎ Removing stale codegen lock"
  rmdir "$LOCK" 2>/dev/null || true
fi

waited=0
until mkdir "$LOCK" 2>/dev/null; do
  if [ $waited -eq 0 ]; then echo "⏳ Another codegen run is in progress, waiting…"; fi
  sleep 2
  waited=$((waited + 2))
done
trap 'rmdir "$LOCK" 2>/dev/null || true' EXIT

dart run tool/l10n_merge.dart
flutter gen-l10n

if [ "${1:-}" != "--l10n" ]; then
  dart run build_runner build
fi
echo "✓ codegen complete"
