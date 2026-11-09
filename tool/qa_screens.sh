#!/usr/bin/env bash
# Visual QA: opens screens through deep links on a booted iOS simulator and
# captures screenshots into build/qa_screens/ (one PNG per route).
#
# Prerequisite: the app is installed and running on the simulator, e.g.
#   flutter run --flavor dev -t lib/main_dev.dart --dart-define=SKIP_ONBOARDING=true
#
# Usage: tool/qa_screens.sh                 # all routes below
#        tool/qa_screens.sh /restaurant/mide-lagos home-restaurant   # one route
set -euo pipefail
cd "$(dirname "$0")/.."

DEVICE="${DEVICE:-booted}"
OUT="${OUT:-build/qa_screens}"
WAIT="${WAIT:-3}"
mkdir -p "$OUT"

shot() {
  local route="$1" name="$2"
  xcrun simctl openurl "$DEVICE" "tavada://$route"
  sleep "$WAIT"
  xcrun simctl io "$DEVICE" screenshot "$OUT/$name.png" >/dev/null 2>&1
  echo "✓ $name  ←  $route"
}

if [ $# -ge 2 ]; then
  shot "$1" "$2"
  exit 0
fi

shot "/home" "01-home"
shot "/stores" "02-stores"
shot "/basket" "03-basket"
shot "/profile" "04-profile"
shot "/search" "05-search"
shot "/restaurants?section=places_near_you&title=Places%20near%20you" "06-restaurant-list"
shot "/restaurant/mide-lagos" "07-restaurant"
shot "/restaurant/mide-lagos/reviews" "08-reviews"
shot "/restaurant/mide-lagos/menu-search" "09-menu-search"
shot "/restaurant/mide-lagos/item/jollof-haven" "10-dish"
shot "/checkout/mide-lagos" "11-checkout"
shot "/account/wallet/add-money" "12-add-money"
shot "/account/wallet/activity" "13-wallet-activity"
shot "/account/rewards" "14-rewards"
shot "/account/notifications" "15-notifications"
shot "/account/language" "16-language"
shot "/support" "17-help"
shot "/support/chat" "18-chat"
shot "/location/picker" "19-location-picker"
shot "/location/search" "20-location-search"
echo "Screenshots in $OUT"
