// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Tavada Eats';

  @override
  String get appTagline => 'Always African, anywhere';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonSaveChanges => 'Save changes';

  @override
  String get commonDone => 'Done';

  @override
  String get commonApply => 'Apply';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonRetry => 'Try again';

  @override
  String get commonClose => 'Close';

  @override
  String get commonBack => 'Back';

  @override
  String get commonNext => 'Next';

  @override
  String get commonSeeAll => 'See all';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonClearAll => 'Clear all';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonChange => 'Change';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonRemove => 'Remove';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonYes => 'Yes';

  @override
  String get commonNo => 'No';

  @override
  String get commonOk => 'OK';

  @override
  String get commonRequired => 'Required';

  @override
  String get commonOptional => 'Optional';

  @override
  String get commonFree => 'Free';

  @override
  String get commonOr => 'or';

  @override
  String get commonToday => 'Today';

  @override
  String get commonYesterday => 'Yesterday';

  @override
  String get commonJustNow => 'Just now';

  @override
  String get commonReadMore => 'Read more';

  @override
  String get commonShowLess => 'Show less';

  @override
  String get commonMoreInfo => 'more info';

  @override
  String get commonComingSoon => 'Coming soon';

  @override
  String commonComingSoonMessage(String feature) {
    return '$feature is coming soon. Hang tight!';
  }

  @override
  String commonMinutes(int count) {
    return '$count min';
  }

  @override
  String commonMinutesLong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mins',
      one: '1 min',
    );
    return '$_temp0';
  }

  @override
  String commonMiles(String distance) {
    return '$distance mi';
  }

  @override
  String commonResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count results',
      one: '1 result',
      zero: 'No results',
    );
    return '$_temp0';
  }

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String commonRelativeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months ago',
      one: '1 month ago',
    );
    return '$_temp0';
  }

  @override
  String commonRelativeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get navHome => 'Home';

  @override
  String get navStores => 'Stores';

  @override
  String get navBasket => 'Basket';

  @override
  String get navProfile => 'Profile';

  @override
  String get legalAgreePrefix => 'By continuing you agree to our';

  @override
  String get legalPrivacyPolicy => 'Privacy Policy';

  @override
  String get legalAnd => 'and';

  @override
  String get legalTermsOfUse => 'Terms of Use';

  @override
  String get errorTitle => 'Oops!';

  @override
  String get errorNetwork =>
      'You\'re offline. Check your connection and try again.';

  @override
  String get errorTimeout =>
      'This is taking longer than usual. Please try again.';

  @override
  String get errorServer =>
      'Something went wrong on our side. Please try again.';

  @override
  String get errorUnauthorized =>
      'Your session has expired. Please sign in again.';

  @override
  String get errorNotFound => 'We couldn\'t find what you were looking for.';

  @override
  String get errorUnexpected =>
      'Something unexpected happened. Please try again.';

  @override
  String get offlineBanner =>
      'You\'re offline. We\'ll reconnect automatically.';

  @override
  String get backOnlineBanner => 'Back online';

  @override
  String get emptyGenericTitle => 'Nothing here yet';

  @override
  String get emptyGenericMessage => 'Check back soon — new things are cooking.';

  @override
  String get signInRequiredTitle => 'Sign in to continue';

  @override
  String get signInRequiredMessage =>
      'Create an account or log in to place orders, track deliveries and earn rewards.';

  @override
  String get signInRequiredAction => 'Sign in';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languageSystem => 'System default';

  @override
  String get ratingExcellent => 'Excellent';

  @override
  String get ratingVeryGood => 'Very Good';

  @override
  String get ratingGood => 'Good';

  @override
  String get ratingFair => 'Fair';

  @override
  String get mapAttribution => '© OpenStreetMap © CARTO';

  @override
  String get errorGoHome => 'Go to home';

  @override
  String get errorPageNotFound =>
      'This page doesn’t exist (anymore). Let’s get you back to the food.';

  @override
  String get authEmailTitle => 'Create your account';

  @override
  String get authEmailSubtitle =>
      'Tell us your name and the email we’ll use to verify your account';

  @override
  String get authEmailHint => 'Enter your email';

  @override
  String get authHaveAccount => 'Have an account?';

  @override
  String get authLogIn => 'Log in';

  @override
  String get authPhoneTitle => 'What is your phone number?';

  @override
  String get authPhoneSubtitle =>
      'You\'ll use this number to get notifications, sign in, and recover account';

  @override
  String get authPasswordTitle => 'Set your account password';

  @override
  String get authPasswordSubtitle =>
      'Your password should be at least 8 characters long and contain a letter and a number or special character';

  @override
  String get authPasswordHint => 'Enter your password';

  @override
  String get authRuleLength => 'You have at least 8 characters';

  @override
  String get authRuleSpecial => 'It contains a number or special character';

  @override
  String get authRuleLetter => 'It has one letter';

  @override
  String get authOtpTitleEmail =>
      'We sent a code to your email, enter it here to continue';

  @override
  String get authOtpTitlePhone =>
      'We sent a code to your phone, enter it here to continue';

  @override
  String authOtpSentTo(String destination) {
    return 'Sent to $destination';
  }

  @override
  String get authChangeEmail => 'Change your email?';

  @override
  String get authChangePhone => 'Change your number?';

  @override
  String authResendIn(String time) {
    return 'Resend code in $time';
  }

  @override
  String get authResendCode => 'Resend code';

  @override
  String get authCodeResent => 'A new code is on its way';

  @override
  String get authOtpDevTip => 'Dev tip: use 1234';

  @override
  String get authWelcomeBackTitle => 'Welcome back!';

  @override
  String get authWelcomeBackSubtitle => 'Enter your details to continue';

  @override
  String get authUsePhone => 'Use phone number?';

  @override
  String get authUseEmail => 'Use email instead?';

  @override
  String get authForgotPasswordLink => 'Forgot password?';

  @override
  String get authNoAccount => 'Don\'t have an account?';

  @override
  String get authSignUp => 'Sign up';

  @override
  String get authLoginDemoTip => 'Demo: emasv58@yahoo.com · Password1!';

  @override
  String get authForgotTitle => 'Forgot your password?';

  @override
  String get authForgotSubtitle =>
      'We will send a verification code to your email';

  @override
  String get authResetTitle => 'Reset your password';

  @override
  String get authResetSubtitle =>
      'Make the changes you need, don\'t use an old one';

  @override
  String get authConfirmPasswordHint => 'Confirm password';

  @override
  String get authPasswordsMismatch => 'Passwords don\'t match';

  @override
  String get authCompleteChanges => 'Complete changes';

  @override
  String get authPasswordUpdated =>
      'Password updated. Log in with your new password.';

  @override
  String authWelcomeToast(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get authErrorInvalidCredentials => 'Incorrect email or password';

  @override
  String get authErrorPhoneNotFound =>
      'We couldn\'t find an account with that number. Sign up instead?';

  @override
  String get authErrorInvalidCode =>
      'That code isn\'t right. Check it and try again.';

  @override
  String get authErrorEmailTaken =>
      'An account with this email already exists. Log in instead?';

  @override
  String get authErrorInvalidEmail => 'Enter a valid email address';

  @override
  String get authSelectCountry => 'Select country';

  @override
  String get authSearchCountry => 'Search country';

  @override
  String get authFlowExpired => 'This step has expired. Please start again.';

  @override
  String get authFirstNameHint => 'First name';

  @override
  String get authLastNameHint => 'Last name';

  @override
  String get basketTitle => 'Basket';

  @override
  String get basketClearOrders => 'Clear orders';

  @override
  String get basketTabBaskets => 'My Orders';

  @override
  String get basketTabOngoing => 'Ongoing';

  @override
  String get basketTabCompleted => 'Completed';

  @override
  String basketItemsTotal(String items, String total) {
    return '$items · $total';
  }

  @override
  String get basketDeliverTo => 'To: ';

  @override
  String get basketVisitStore => 'Visit store';

  @override
  String get basketCheckout => 'Checkout';

  @override
  String get basketClearAllTitle => 'Clear all baskets?';

  @override
  String get basketClearAllMessage =>
      'Every item in your baskets will be removed.';

  @override
  String get basketClearAllConfirm => 'Clear all';

  @override
  String get basketEmptyTitle => 'Your basket is empty';

  @override
  String get basketEmptyMessage =>
      'Dishes you add from restaurants will show up here.';

  @override
  String get basketBrowse => 'Find something tasty';

  @override
  String get basketNoOngoingTitle => 'No orders on the way';

  @override
  String get basketNoOngoingMessage =>
      'When you place an order you can track it here.';

  @override
  String get basketNoCompletedTitle => 'No past orders yet';

  @override
  String get basketNoCompletedMessage =>
      'Orders you\'ve received will be listed here.';

  @override
  String basketOrderNumber(String number) {
    return 'Order $number';
  }

  @override
  String get basketTrackOrder => 'Track order';

  @override
  String get basketReorder => 'Order again';

  @override
  String get basketViewDetails => 'View details';

  @override
  String get basketSignInMessage =>
      'Sign in to see your ongoing and past orders.';

  @override
  String get basketViewTimeline => 'View timeline';

  @override
  String basketOrderEta(String status, String time) {
    return '$status · arriving $time';
  }

  @override
  String basketRemoved(String store) {
    return '$store basket removed';
  }

  @override
  String get basketUndo => 'Undo';

  @override
  String get cartAdded => 'Added to your basket';

  @override
  String get cartViewBasket => 'View basket';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutHideSelections => 'Hide selections';

  @override
  String get checkoutShowSelections => 'Show selections';

  @override
  String checkoutPack(int number) {
    return 'Pack $number';
  }

  @override
  String get checkoutYourSelections => 'Your Selections';

  @override
  String get checkoutEditSelection => 'Edit selection';

  @override
  String get checkoutAddAnotherItem => 'Add another item';

  @override
  String get checkoutDeliveryInfo => 'Delivery Info';

  @override
  String get checkoutDelivery => 'Delivery';

  @override
  String get checkoutPickup => 'Pickup';

  @override
  String checkoutMiles(String distance) {
    return '$distance miles';
  }

  @override
  String get checkoutChooseAddress => 'Choose a delivery address';

  @override
  String get checkoutDeliveryInstructions => 'Delivery instructions';

  @override
  String get checkoutDeliveryInstructionsHint =>
      'Add specific information to the rider';

  @override
  String get checkoutAllergyInfo => 'Allergy & Dietary Info';

  @override
  String get checkoutAllergyInformation => 'Allergy Information';

  @override
  String get checkoutDietaryLabels => 'Dietary Labels';

  @override
  String checkoutDeliversIn(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Delivers in $minutes mins',
      one: 'Delivers in 1 min',
    );
    return '$_temp0';
  }

  @override
  String get checkoutStoreLocation => 'Store location';

  @override
  String get checkoutDistance => 'Distance';

  @override
  String get checkoutPickupTime => 'Pickup time';

  @override
  String checkoutPickupWindow(int from, int to) {
    return '$from - $to mins';
  }

  @override
  String get checkoutPaymentOption => 'Choose your payment option';

  @override
  String get checkoutPayWithWallet => 'Pay with wallet';

  @override
  String checkoutWalletBalance(String balance) {
    return 'Bal: $balance';
  }

  @override
  String get checkoutPayWithCard => 'Use credit or debit card';

  @override
  String get checkoutWalletTooLow => 'Balance too low for this order';

  @override
  String get checkoutCutlery => 'Request cutlery or straws';

  @override
  String get checkoutSendAsGift => 'Send as gift';

  @override
  String checkoutGiftFor(String name) {
    return 'Gift for $name';
  }

  @override
  String get checkoutGiftSaved => 'Gift details saved';

  @override
  String get checkoutPaymentSummary => 'Payment summary';

  @override
  String get checkoutSubtotal => 'Subtotal';

  @override
  String get checkoutDeliveryFee => 'Delivery fee';

  @override
  String get checkoutServiceFee => 'Service fee';

  @override
  String get checkoutDiscount => 'Discount applied';

  @override
  String get checkoutTotal => 'Total';

  @override
  String get checkoutMakePayment => 'Make payment';

  @override
  String get checkoutClearTitle => 'Clear this basket?';

  @override
  String checkoutClearMessage(String store) {
    return 'All items from $store will be removed.';
  }

  @override
  String get checkoutClearConfirm => 'Clear basket';

  @override
  String get checkoutRemovePackTitle => 'Remove this pack?';

  @override
  String checkoutRemovePackMessage(String name) {
    return '$name will be removed from your basket.';
  }

  @override
  String get checkoutInstructionsHint => 'Leave a message...';

  @override
  String get checkoutAddNote => 'Add note';

  @override
  String get checkoutGiftTitle => 'Customize your gift';

  @override
  String get checkoutGiftSender => 'Who is sending this gift?';

  @override
  String get checkoutGiftRecipient => 'Who is this gift for?';

  @override
  String get checkoutGiftRecipientHint => 'Enter their name or nickname';

  @override
  String get checkoutGiftPhone => 'Recipient’s phone number';

  @override
  String get checkoutGiftFindContacts => 'Find from contacts';

  @override
  String get checkoutGiftNote => 'Add a note';

  @override
  String get checkoutGiftSave => 'Save gift';

  @override
  String get checkoutGiftRemove => 'Remove gift';

  @override
  String get checkoutContactsTitle => 'Choose a contact';

  @override
  String get checkoutEmptyTitle => 'Your basket is empty';

  @override
  String get checkoutEmptyMessage => 'Add a few dishes to check out.';

  @override
  String get checkoutBackToStore => 'Back to store';

  @override
  String get checkoutUseCard => 'Use card';

  @override
  String checkoutClosedBanner(String store, String time) {
    return '$store is closed right now. It opens at $time.';
  }

  @override
  String get checkoutCountryPicker => 'Select country';

  @override
  String get checkoutCountrySearch => 'Search country';

  @override
  String get checkoutQuoteFailed =>
      'We couldn’t update your total. Try again before paying.';

  @override
  String get checkoutTopUp => 'Top up';

  @override
  String get checkoutWalletBlocked =>
      'Top up your wallet or pay by card to continue.';

  @override
  String checkoutClosedShort(String store, String time) {
    return '$store is closed · opens at $time';
  }

  @override
  String get homeNow => 'Now';

  @override
  String get homeAddAddress => 'Add a delivery address';

  @override
  String get homeFilter => 'Filter';

  @override
  String get homeSearchHint => 'Search African dishes and restaurants';

  @override
  String get homeFilterDiscounts => 'Discounts';

  @override
  String get homeFilterCuisines => 'Cuisines';

  @override
  String get homeFilterTopRated => 'Top-rated';

  @override
  String get homeFilterUnder30 => 'Under 30 min';

  @override
  String get homeFilterDietary => 'Dietary';

  @override
  String get homeFilterDeliveryFee => 'Delivery fee';

  @override
  String get homeFilterOffers => 'Offers';

  @override
  String get homeCuisinesTitle => 'Choose your favourite cuisines';

  @override
  String get homeDietaryTitle => 'Dietary';

  @override
  String get homeDeliveryFeeTitle => 'Delivery fee';

  @override
  String get homeChangeLocationTitle => 'Change location to..';

  @override
  String get homeSearchElsewhere => 'Search someplace else';

  @override
  String get homeUseCurrentLocation => 'Use my current location';

  @override
  String get homeNoResultsTitle => 'No places match your filters';

  @override
  String get homeNoResultsMessage => 'Try removing a filter or two';

  @override
  String get homeListEmptyTitle => 'Nothing here yet';

  @override
  String get homeListEmptyMessage =>
      'New places are joining Tavada every week.';

  @override
  String get homeNoStoresTitle => 'We’re not in your area yet';

  @override
  String get homeNoStoresMessage =>
      'No stores deliver to this address yet. Try another address.';

  @override
  String get homeChangeAddress => 'Change address';

  @override
  String get locationIntroShout => 'Howfa naw!';

  @override
  String get locationIntroTitle => 'Where do you stay?';

  @override
  String get locationIntroBody =>
      'Help us know your location so that we can show you nearby places you can order from';

  @override
  String get locationFindMe => 'Find me';

  @override
  String get locationSearchInstead => 'Search for an address instead';

  @override
  String get locationPickerTitle => 'Choose location';

  @override
  String get locationSearchHint => 'Search here or move map';

  @override
  String get locationDragHint => 'Drag the map to your preferred location';

  @override
  String get locationConfirmCurrent => 'Confirm your current location';

  @override
  String get locationSelect => 'Select this location';

  @override
  String get locationResolving => 'Finding address…';

  @override
  String get locationDroppedPin => 'Dropped pin';

  @override
  String get locationRecenter => 'Recenter';

  @override
  String get locationNoResultsTitle => 'No places found';

  @override
  String get locationNoResultsMessage => 'Try a street, area or postcode';

  @override
  String get locationSearchEmptyTitle => 'Where should we deliver?';

  @override
  String get locationSearchEmptyMessage =>
      'Search for a street, area or postcode';

  @override
  String get locationUseCurrent => 'Use my current location';

  @override
  String get locationServiceDisabledTitle => 'Location is turned off';

  @override
  String get locationServiceDisabledMessage =>
      'Turn on location services to find restaurants near you, or pick your address on the map.';

  @override
  String get locationDeniedForeverTitle => 'Location access is off';

  @override
  String get locationDeniedForeverMessage =>
      'Allow location access for Tavada Eats in Settings, or pick your address on the map.';

  @override
  String get locationOpenSettings => 'Open settings';

  @override
  String get locationChooseOnMap => 'Choose on map';

  @override
  String get locationFallbackToast =>
      'We couldn\'t get your location, so we\'ve started you in London.';

  @override
  String locationDeliveringTo(String address) {
    return 'Delivering to $address';
  }

  @override
  String get locationPinnedTitle => 'Pinned location';

  @override
  String get locationResolveFailed =>
      'We couldn’t look up this address. You can still use the pin.';

  @override
  String get onboardingContinueAsGuest => 'Continue as guest';

  @override
  String get onboardingHeadlineTop => 'ALWAYS AFRICAN';

  @override
  String get onboardingHeadlineBottom => 'ANYWHERE';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get onboardingLogIn => 'Log in to your account';

  @override
  String get onboardingContinueWithApple => 'Continue with Apple';

  @override
  String get onboardingContinueWithGoogle => 'Continue with Google';

  @override
  String get onboardingContinueWithEmail => 'Continue with Email';

  @override
  String get onboardingAppleSignIn => 'Sign in with Apple';

  @override
  String get onboardingGoogleSignIn => 'Sign in with Google';

  @override
  String get ordersHangTight => 'Hang tight, we are on it';

  @override
  String get ordersEstimatedArrival => 'Estimated arrival';

  @override
  String get ordersStatusPlaced => 'Order placed';

  @override
  String get ordersStatusPreparing => 'Preparing order';

  @override
  String get ordersStatusRiderPicked => 'Rider picks order';

  @override
  String get ordersStatusDispatched => 'Order dispatched';

  @override
  String get ordersStatusDelivered => 'Delivered';

  @override
  String get ordersStatusCancelled => 'Cancelled';

  @override
  String get ordersCallRider => 'Call rider';

  @override
  String get ordersDeliveryInfo => 'Delivery Info';

  @override
  String get ordersAddress => 'Address';

  @override
  String get ordersPickupFrom => 'Pickup from';

  @override
  String get ordersInstruction => 'Delivery instruction';

  @override
  String get ordersNoInstruction => 'No instructions for the rider';

  @override
  String get ordersChange => 'Change';

  @override
  String get ordersEdit => 'Edit';

  @override
  String get ordersChangeAfterPlacing =>
      'This order is already on its way. Chat with us to change the delivery details.';

  @override
  String get ordersChat => 'Chat';

  @override
  String get ordersSummary => 'Order summary';

  @override
  String get ordersPaymentDetails => 'Payment details';

  @override
  String get ordersPaymentSummary => 'Payment summary';

  @override
  String ordersArrivedIn(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Yay! Your food arrived in just $minutes mins',
      one: 'Yay! Your food arrived in just 1 min',
    );
    return '$_temp0';
  }

  @override
  String get ordersRateBy => 'Rate your delivery by ';

  @override
  String get ordersThanksRating => 'Thanks for rating your delivery!';

  @override
  String get ordersRepeat => 'Repeat order';

  @override
  String get ordersRepeated => 'Added to your basket';

  @override
  String get ordersTimeOfDelivery => 'Time of delivery';

  @override
  String get ordersEstimatedDelivery => 'Estimated delivery';

  @override
  String ordersMilestoneConfirmed(String store) {
    return '$store has confirmed your order';
  }

  @override
  String get ordersMilestoneRiderAssigned =>
      'A rider has been assigned to your order';

  @override
  String get ordersMilestoneReady =>
      'Your order is ready to be picked by the rider';

  @override
  String get ordersMilestonePickedUp => 'The rider has picked up your order';

  @override
  String get ordersMilestoneArrived => 'The rider arrived at your location';

  @override
  String get ordersViewTimeline => 'View timeline';

  @override
  String ordersGiftFor(String name) {
    return 'Gift for $name';
  }

  @override
  String ordersRepeatTitle(String store) {
    return 'You already have a $store basket';
  }

  @override
  String get ordersRepeatMessage =>
      'Replace it with this order, or add these items to it?';

  @override
  String get ordersRepeatReplace => 'Replace basket';

  @override
  String get ordersRepeatAdd => 'Add to basket';

  @override
  String ordersRepeatUnavailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items are no longer available and were left out',
      one: '1 item is no longer available and was left out',
    );
    return '$_temp0';
  }

  @override
  String get ordersNeedHelp => 'Need help with this order?';

  @override
  String get profileGuest => 'Hi there!';

  @override
  String get profileGuestMessage =>
      'Sign in to see your wallet, rewards and orders.';

  @override
  String get profileSignIn => 'Sign in or create account';

  @override
  String get profileWalletBalance => 'Wallet Balance';

  @override
  String get profileAddMoney => 'Add funds';

  @override
  String get profileSeeActivity => 'See activity';

  @override
  String get profileUpdatePhone => 'Update phone number';

  @override
  String get profileChangePassword => 'Change password';

  @override
  String get profileNotifications => 'Notification preferences';

  @override
  String get profileRewards => 'Rewards';

  @override
  String get profileAccessibility => 'Accessibility';

  @override
  String get profileHelp => 'Get help';

  @override
  String get profileLanguage => 'Language';

  @override
  String get profileHaptics => 'Haptic feedback';

  @override
  String get profileLogout => 'Log out';

  @override
  String get profileLogoutTitle => 'Log out?';

  @override
  String get profileLogoutMessage =>
      'You can sign back in any time. Your baskets stay on this device.';

  @override
  String profilePointsToNext(String points) {
    return '$points pts';
  }

  @override
  String get profilePointsToNextSuffix => ' more to next reward';

  @override
  String profileEarnReward(String value, String points) {
    return 'Earn $value when you reach $points pts';
  }

  @override
  String get profileRedeemPoints => 'Redeem points';

  @override
  String profileReferFriend(String points) {
    return 'Refer a friend,\nget ${points}pts';
  }

  @override
  String profileRedeemed(String value) {
    return '$value added to your wallet!';
  }

  @override
  String profileVersion(String version) {
    return 'Version $version';
  }

  @override
  String get updatePhoneTitle => 'Update your phone number?';

  @override
  String get updatePhoneSubtitle =>
      'You\'ll use this number to get notifications, sign in, and recover account';

  @override
  String get updatePhoneSaved => 'Phone number updated';

  @override
  String get changePasswordTitle => 'Change your password';

  @override
  String get changePasswordSubtitle =>
      'Enter your current password, then choose a new one';

  @override
  String get changePasswordSaved => 'Password changed';

  @override
  String get notificationsTitle => 'Notification preferences';

  @override
  String get notificationsSubtitle =>
      'Choose how you would like to get notified for special offers, promos, and more';

  @override
  String get notificationsPush => 'Push notifications';

  @override
  String get notificationsWhatsapp => 'WhatsApp';

  @override
  String get notificationsEmail => 'Email';

  @override
  String get notificationsOn => 'On';

  @override
  String get notificationsOff => 'Off';

  @override
  String get notificationsCategoriesTitle => 'Categories';

  @override
  String get notificationsOrderStatus => 'Order Status Update';

  @override
  String get notificationsOrderStatusBody =>
      'Allow to send notifications and show live order tracking updates';

  @override
  String get notificationsPromotions => 'Promotional Notifications';

  @override
  String get notificationsPromotionsBody =>
      'Notify me about exclusive offers, money saving offers, and promotions';

  @override
  String get notificationsRecommendations => 'Recommendations';

  @override
  String get notificationsRecommendationsBody =>
      'Let me know about recommendations on great food, groceries and more';

  @override
  String get notificationsReminders => 'Reminders';

  @override
  String get notificationsRemindersBody => 'Notify me for unfinished orders';

  @override
  String get notificationsSaved => 'Preferences saved';

  @override
  String get accessibilityTitle => 'Accessibility';

  @override
  String get accessibilitySubtitle => 'Help riders and stores serve you better';

  @override
  String get accessibilityHearing => 'Hearing';

  @override
  String get accessibilityHearingBody =>
      'Choose to disclose to riders whether you are deaf or have difficulty hearing';

  @override
  String get accessibilityHearingNone => 'I am not deaf or hard of hearing';

  @override
  String get accessibilityHearingDeaf => 'I am deaf';

  @override
  String get accessibilityHearingHard => 'I am hard of hearing';

  @override
  String get accessibilitySaved => 'Accessibility settings saved';

  @override
  String get addMoneyTitle => 'Add money';

  @override
  String addMoneyBalance(String balance) {
    return 'Balance: $balance';
  }

  @override
  String get addMoneySecurely => 'Add money securely';

  @override
  String addMoneySuccess(String amount) {
    return '$amount added to your wallet';
  }

  @override
  String get walletActivityTitle => 'Wallet activity';

  @override
  String get walletEmptyTitle => 'No activity yet';

  @override
  String get walletEmptyMessage =>
      'Top-ups, payments and refunds will show up here.';

  @override
  String get walletTopUp => 'Wallet top-up';

  @override
  String get walletPayment => 'Order payment';

  @override
  String get walletRefund => 'Refund';

  @override
  String get walletReward => 'Reward';

  @override
  String get rewardsTitle => 'Rewards';

  @override
  String rewardsPoints(String points) {
    return '$points pts';
  }

  @override
  String get rewardsYourPoints => 'Your points';

  @override
  String get rewardsHowItWorks => 'How it works';

  @override
  String get rewardsHow1 => 'Earn 10 points for every £1 you spend.';

  @override
  String rewardsHow2(String points, String value) {
    return 'Redeem $points points for $value wallet credit.';
  }

  @override
  String rewardsHow3(String points) {
    return 'Invite friends with your code — you both get $points points.';
  }

  @override
  String get rewardsReferralCode => 'Your referral code';

  @override
  String get rewardsShare => 'Share code';

  @override
  String rewardsShareText(String code) {
    return 'Join me on Tavada Eats with my code $code and we both get bonus points!';
  }

  @override
  String get rewardsCopied => 'Code copied';

  @override
  String get languageTitle => 'Language';

  @override
  String get languageSubtitle => 'Choose the language for the app';

  @override
  String get changePasswordCurrentHint => 'Current password';

  @override
  String get changePasswordNewHint => 'New password';

  @override
  String get updatePhoneCodeTitle => 'Enter the code we sent you';

  @override
  String updatePhoneCodeSubtitle(String phone) {
    return 'We sent a 4-digit code to $phone to make sure it’s yours';
  }

  @override
  String get updatePhoneVerify => 'Verify and save';

  @override
  String get profileEditName => 'Edit your name';

  @override
  String get profileEditNameSubtitle =>
      'This is how stores and riders will greet you';

  @override
  String get profileNameSaved => 'Name updated';

  @override
  String get profileEditProfile => 'Edit name';

  @override
  String get profileDeleteAccount => 'Delete account';

  @override
  String get profileDeleteTitle => 'Delete your account?';

  @override
  String get profileDeleteMessage =>
      'This permanently deletes your account, order history, wallet balance and reward points. It can’t be undone.';

  @override
  String get profileDeleteConfirm => 'Delete my account';

  @override
  String get profileDeleted => 'Your account has been deleted';

  @override
  String addMoneyMinimum(String amount, String card) {
    return 'Minimum top-up is $amount · charged to $card';
  }

  @override
  String get rewardsPointsSuffix => ' pts';

  @override
  String restaurantComments(int count) {
    return '$count comments';
  }

  @override
  String get restaurantDeliveryTime => 'Delivery Time';

  @override
  String get restaurantCuisine => 'Cuisine';

  @override
  String get restaurantDeliveryFee => 'Delivery fee';

  @override
  String get restaurantAiSummary => 'AI summary';

  @override
  String get restaurantAiDisclaimer =>
      'This summary is automatically generated from customer reviews. We do not guarantee the accuracy, timeliness, or completeness of the information provided.';

  @override
  String get restaurantPopularOrders => 'Popular orders';

  @override
  String get restaurantMenu => 'Menu';

  @override
  String get restaurantSearchMenu => 'Search menu';

  @override
  String get restaurantSearchMenuHint => 'Search dishes and drinks';

  @override
  String get restaurantSearchMenuMessage =>
      'Find your favourite dish or drink here';

  @override
  String get restaurantNoDishesTitle => 'No dishes found';

  @override
  String get restaurantNoDishesMessage => 'Try a different name or ingredient';

  @override
  String restaurantOpenUntil(String time) {
    return 'Open now · Until $time';
  }

  @override
  String restaurantClosedOpensAt(String time) {
    return 'Closed · Opens $time';
  }

  @override
  String restaurantRatingReviews(String rating, int count) {
    return '$rating ($count reviews)';
  }

  @override
  String get restaurantAllergyInfo => 'Allergy & Dietary Info';

  @override
  String get restaurantAllergyInformation => 'Allergy Information';

  @override
  String get restaurantDietaryLabels => 'Dietary Labels';

  @override
  String restaurantOrdersCount(String count) {
    return '$count orders';
  }

  @override
  String get restaurantOrdersPeriod => 'in the last 12 months';

  @override
  String get restaurantAddressCopied => 'Address copied';

  @override
  String restaurantMilesAway(String distance) {
    return '$distance miles';
  }

  @override
  String restaurantShareText(String name) {
    return 'Order from $name on Tavada Eats';
  }

  @override
  String get restaurantClosedBanner =>
      'Closed right now. You can still browse the menu.';

  @override
  String get reviewsTitle => 'Reviews';

  @override
  String reviewsCount(int count) {
    return '$count+ reviews';
  }

  @override
  String get reviewsComments => 'Comments';

  @override
  String get reviewsRestaurantReply => 'Restaurant\'s Reply';

  @override
  String get reviewsThanksFeedback => 'Thanks for your feedback';

  @override
  String get reviewsEmptyTitle => 'No reviews yet';

  @override
  String get reviewsEmptyMessage => 'Be the first to order and leave a review.';

  @override
  String get dishRequired => 'Required';

  @override
  String get dishOptional => 'Optional';

  @override
  String dishChooseUpTo(int count) {
    return 'Choose up to $count';
  }

  @override
  String dishAddFor(String price) {
    return 'Add for $price';
  }

  @override
  String dishUpdateFor(String price) {
    return 'Update order for $price';
  }

  @override
  String dishPercentOff(int percent) {
    return '$percent% off';
  }

  @override
  String get dishAllergenNotice =>
      'Food may contain allergens. Questions for specific allergen information? ';

  @override
  String get dishContactRestaurant => 'Please contact the restaurant';

  @override
  String get dishNoteHint => 'Add a note for the kitchen (optional)';

  @override
  String dishDeliveryMeta(String fee, String eta) {
    return '$fee Delivery fee · $eta';
  }

  @override
  String dishFreeDeliveryMeta(String eta) {
    return 'Free delivery · $eta';
  }

  @override
  String dishChooseRequired(String group) {
    return 'Choose an option for “$group”';
  }

  @override
  String dishMaxReached(int count) {
    return 'You can choose up to $count';
  }

  @override
  String restaurantClosedBannerAt(String time) {
    return 'Closed right now · opens at $time. You can still browse the menu.';
  }

  @override
  String get dishNoteTitle => 'Special instructions';

  @override
  String get searchHint => 'Search African dishes and restaurants';

  @override
  String get searchRecent => 'Recent searches';

  @override
  String get searchCategories => 'Categories';

  @override
  String get searchTrendyCuisines => 'Trendy cuisines near you';

  @override
  String searchFor(String query) {
    return 'Search for “$query”';
  }

  @override
  String get searchAllAfrica => 'All Africa';

  @override
  String searchDeliveryFee(String fee) {
    return '$fee Delivery fee';
  }

  @override
  String get searchFreeDelivery => 'Free delivery';

  @override
  String searchNoResultsTitle(String query) {
    return 'No matches for “$query”';
  }

  @override
  String get searchNoResultsMessage =>
      'Check the spelling or try a different dish, drink or restaurant.';

  @override
  String get helpTitle => 'How can we help?';

  @override
  String get helpSubtitle => 'Our team is ready to help you 24/7';

  @override
  String get helpChatWithPerson => 'Chat with a person';

  @override
  String get helpWasHelpful => 'Was this helpful?';

  @override
  String get helpYes => 'Yes';

  @override
  String get helpNo => 'No';

  @override
  String get helpThanks => 'Thanks for letting us know!';

  @override
  String get chatTitle => 'Chat with support';

  @override
  String chatWithAgent(String name) {
    return 'Chatting with $name';
  }

  @override
  String get chatEmpty =>
      'Share your concerns with us, we\'re here to help and make things right!';

  @override
  String get chatHint => 'Share your concerns';

  @override
  String get chatSendFailed => 'Message not sent. Tap to retry.';

  @override
  String get chatAttachPhoto => 'Attach a photo';

  @override
  String chatTyping(String name) {
    return '$name is typing';
  }

  @override
  String get chatPhotoAccessDenied =>
      'We can’t open your photos. Allow photo access in Settings to send a picture.';
}
