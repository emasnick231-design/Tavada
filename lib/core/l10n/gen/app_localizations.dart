import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Tavada Eats'**
  String get appName;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Always African, anywhere'**
  String get appTagline;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonSaveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get commonSaveChanges;

  /// No description provided for @commonDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get commonDone;

  /// No description provided for @commonApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get commonApply;

  /// No description provided for @commonReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get commonReset;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get commonRetry;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get commonSeeAll;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get commonClearAll;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get commonChange;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get commonRemove;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get commonYes;

  /// No description provided for @commonNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get commonNo;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @commonRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get commonRequired;

  /// No description provided for @commonOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get commonOptional;

  /// No description provided for @commonFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get commonFree;

  /// No description provided for @commonOr.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get commonOr;

  /// No description provided for @commonToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get commonToday;

  /// No description provided for @commonYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get commonYesterday;

  /// No description provided for @commonJustNow.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get commonJustNow;

  /// No description provided for @commonReadMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get commonReadMore;

  /// No description provided for @commonShowLess.
  ///
  /// In en, this message translates to:
  /// **'Show less'**
  String get commonShowLess;

  /// No description provided for @commonMoreInfo.
  ///
  /// In en, this message translates to:
  /// **'more info'**
  String get commonMoreInfo;

  /// No description provided for @commonComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get commonComingSoon;

  /// No description provided for @commonComingSoonMessage.
  ///
  /// In en, this message translates to:
  /// **'{feature} is coming soon. Hang tight!'**
  String commonComingSoonMessage(String feature);

  /// No description provided for @commonMinutes.
  ///
  /// In en, this message translates to:
  /// **'{count} min'**
  String commonMinutes(int count);

  /// No description provided for @commonMinutesLong.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 min} other{{count} mins}}'**
  String commonMinutesLong(int count);

  /// No description provided for @commonMiles.
  ///
  /// In en, this message translates to:
  /// **'{distance} mi'**
  String commonMiles(String distance);

  /// No description provided for @commonResults.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No results} =1{1 result} other{{count} results}}'**
  String commonResults(int count);

  /// No description provided for @commonItems.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item} other{{count} items}}'**
  String commonItems(int count);

  /// No description provided for @commonRelativeMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 month ago} other{{count} months ago}}'**
  String commonRelativeMonths(int count);

  /// No description provided for @commonRelativeDays.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day ago} other{{count} days ago}}'**
  String commonRelativeDays(int count);

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navStores.
  ///
  /// In en, this message translates to:
  /// **'Stores'**
  String get navStores;

  /// No description provided for @navBasket.
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get navBasket;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @legalAgreePrefix.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our'**
  String get legalAgreePrefix;

  /// No description provided for @legalPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get legalPrivacyPolicy;

  /// No description provided for @legalAnd.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get legalAnd;

  /// No description provided for @legalTermsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get legalTermsOfUse;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get errorTitle;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. Check your connection and try again.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'This is taking longer than usual. Please try again.'**
  String get errorTimeout;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong on our side. Please try again.'**
  String get errorServer;

  /// No description provided for @errorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please sign in again.'**
  String get errorUnauthorized;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find what you were looking for.'**
  String get errorNotFound;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'Something unexpected happened. Please try again.'**
  String get errorUnexpected;

  /// No description provided for @offlineBanner.
  ///
  /// In en, this message translates to:
  /// **'You\'re offline. We\'ll reconnect automatically.'**
  String get offlineBanner;

  /// No description provided for @backOnlineBanner.
  ///
  /// In en, this message translates to:
  /// **'Back online'**
  String get backOnlineBanner;

  /// No description provided for @emptyGenericTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get emptyGenericTitle;

  /// No description provided for @emptyGenericMessage.
  ///
  /// In en, this message translates to:
  /// **'Check back soon — new things are cooking.'**
  String get emptyGenericMessage;

  /// No description provided for @signInRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get signInRequiredTitle;

  /// No description provided for @signInRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Create an account or log in to place orders, track deliveries and earn rewards.'**
  String get signInRequiredMessage;

  /// No description provided for @signInRequiredAction.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInRequiredAction;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageTurkish.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get languageTurkish;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystem;

  /// No description provided for @ratingExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get ratingExcellent;

  /// No description provided for @ratingVeryGood.
  ///
  /// In en, this message translates to:
  /// **'Very Good'**
  String get ratingVeryGood;

  /// No description provided for @ratingGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get ratingGood;

  /// No description provided for @ratingFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get ratingFair;

  /// No description provided for @mapAttribution.
  ///
  /// In en, this message translates to:
  /// **'© OpenStreetMap © CARTO'**
  String get mapAttribution;

  /// No description provided for @errorGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go to home'**
  String get errorGoHome;

  /// No description provided for @errorPageNotFound.
  ///
  /// In en, this message translates to:
  /// **'This page doesn’t exist (anymore). Let’s get you back to the food.'**
  String get errorPageNotFound;

  /// No description provided for @authEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get authEmailTitle;

  /// No description provided for @authEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us your name and the email we’ll use to verify your account'**
  String get authEmailSubtitle;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEmailHint;

  /// No description provided for @authHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Have an account?'**
  String get authHaveAccount;

  /// No description provided for @authLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get authLogIn;

  /// No description provided for @authPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'What is your phone number?'**
  String get authPhoneTitle;

  /// No description provided for @authPhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'ll use this number to get notifications, sign in, and recover account'**
  String get authPhoneSubtitle;

  /// No description provided for @authPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Set your account password'**
  String get authPasswordTitle;

  /// No description provided for @authPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your password should be at least 8 characters long and contain a letter and a number or special character'**
  String get authPasswordSubtitle;

  /// No description provided for @authPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get authPasswordHint;

  /// No description provided for @authRuleLength.
  ///
  /// In en, this message translates to:
  /// **'You have at least 8 characters'**
  String get authRuleLength;

  /// No description provided for @authRuleSpecial.
  ///
  /// In en, this message translates to:
  /// **'It contains a number or special character'**
  String get authRuleSpecial;

  /// No description provided for @authRuleLetter.
  ///
  /// In en, this message translates to:
  /// **'It has one letter'**
  String get authRuleLetter;

  /// No description provided for @authOtpTitleEmail.
  ///
  /// In en, this message translates to:
  /// **'We sent a code to your email, enter it here to continue'**
  String get authOtpTitleEmail;

  /// No description provided for @authOtpTitlePhone.
  ///
  /// In en, this message translates to:
  /// **'We sent a code to your phone, enter it here to continue'**
  String get authOtpTitlePhone;

  /// No description provided for @authOtpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Sent to {destination}'**
  String authOtpSentTo(String destination);

  /// No description provided for @authChangeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change your email?'**
  String get authChangeEmail;

  /// No description provided for @authChangePhone.
  ///
  /// In en, this message translates to:
  /// **'Change your number?'**
  String get authChangePhone;

  /// No description provided for @authResendIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {time}'**
  String authResendIn(String time);

  /// No description provided for @authResendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get authResendCode;

  /// No description provided for @authCodeResent.
  ///
  /// In en, this message translates to:
  /// **'A new code is on its way'**
  String get authCodeResent;

  /// No description provided for @authOtpDevTip.
  ///
  /// In en, this message translates to:
  /// **'Dev tip: use 1234'**
  String get authOtpDevTip;

  /// No description provided for @authWelcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get authWelcomeBackTitle;

  /// No description provided for @authWelcomeBackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your details to continue'**
  String get authWelcomeBackSubtitle;

  /// No description provided for @authUsePhone.
  ///
  /// In en, this message translates to:
  /// **'Use phone number?'**
  String get authUsePhone;

  /// No description provided for @authUseEmail.
  ///
  /// In en, this message translates to:
  /// **'Use email instead?'**
  String get authUseEmail;

  /// No description provided for @authForgotPasswordLink.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get authForgotPasswordLink;

  /// No description provided for @authNoAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get authNoAccount;

  /// No description provided for @authSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authSignUp;

  /// No description provided for @authLoginDemoTip.
  ///
  /// In en, this message translates to:
  /// **'Demo: emasv58@yahoo.com · Password1!'**
  String get authLoginDemoTip;

  /// No description provided for @authForgotTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot your password?'**
  String get authForgotTitle;

  /// No description provided for @authForgotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We will send a verification code to your email'**
  String get authForgotSubtitle;

  /// No description provided for @authResetTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get authResetTitle;

  /// No description provided for @authResetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Make the changes you need, don\'t use an old one'**
  String get authResetSubtitle;

  /// No description provided for @authConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get authConfirmPasswordHint;

  /// No description provided for @authPasswordsMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords don\'t match'**
  String get authPasswordsMismatch;

  /// No description provided for @authCompleteChanges.
  ///
  /// In en, this message translates to:
  /// **'Complete changes'**
  String get authCompleteChanges;

  /// No description provided for @authPasswordUpdated.
  ///
  /// In en, this message translates to:
  /// **'Password updated. Log in with your new password.'**
  String get authPasswordUpdated;

  /// No description provided for @authWelcomeToast.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String authWelcomeToast(String name);

  /// No description provided for @authErrorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password'**
  String get authErrorInvalidCredentials;

  /// No description provided for @authErrorPhoneNotFound.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find an account with that number. Sign up instead?'**
  String get authErrorPhoneNotFound;

  /// No description provided for @authErrorInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'That code isn\'t right. Check it and try again.'**
  String get authErrorInvalidCode;

  /// No description provided for @authErrorEmailTaken.
  ///
  /// In en, this message translates to:
  /// **'An account with this email already exists. Log in instead?'**
  String get authErrorEmailTaken;

  /// No description provided for @authErrorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get authErrorInvalidEmail;

  /// No description provided for @authSelectCountry.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get authSelectCountry;

  /// No description provided for @authSearchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country'**
  String get authSearchCountry;

  /// No description provided for @authFlowExpired.
  ///
  /// In en, this message translates to:
  /// **'This step has expired. Please start again.'**
  String get authFlowExpired;

  /// No description provided for @authFirstNameHint.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get authFirstNameHint;

  /// No description provided for @authLastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get authLastNameHint;

  /// No description provided for @basketTitle.
  ///
  /// In en, this message translates to:
  /// **'Basket'**
  String get basketTitle;

  /// No description provided for @basketClearOrders.
  ///
  /// In en, this message translates to:
  /// **'Clear orders'**
  String get basketClearOrders;

  /// No description provided for @basketTabBaskets.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get basketTabBaskets;

  /// No description provided for @basketTabOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get basketTabOngoing;

  /// No description provided for @basketTabCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get basketTabCompleted;

  /// No description provided for @basketItemsTotal.
  ///
  /// In en, this message translates to:
  /// **'{items} · {total}'**
  String basketItemsTotal(String items, String total);

  /// No description provided for @basketDeliverTo.
  ///
  /// In en, this message translates to:
  /// **'To: '**
  String get basketDeliverTo;

  /// No description provided for @basketVisitStore.
  ///
  /// In en, this message translates to:
  /// **'Visit store'**
  String get basketVisitStore;

  /// No description provided for @basketCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get basketCheckout;

  /// No description provided for @basketClearAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all baskets?'**
  String get basketClearAllTitle;

  /// No description provided for @basketClearAllMessage.
  ///
  /// In en, this message translates to:
  /// **'Every item in your baskets will be removed.'**
  String get basketClearAllMessage;

  /// No description provided for @basketClearAllConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get basketClearAllConfirm;

  /// No description provided for @basketEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your basket is empty'**
  String get basketEmptyTitle;

  /// No description provided for @basketEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Dishes you add from restaurants will show up here.'**
  String get basketEmptyMessage;

  /// No description provided for @basketBrowse.
  ///
  /// In en, this message translates to:
  /// **'Find something tasty'**
  String get basketBrowse;

  /// No description provided for @basketNoOngoingTitle.
  ///
  /// In en, this message translates to:
  /// **'No orders on the way'**
  String get basketNoOngoingTitle;

  /// No description provided for @basketNoOngoingMessage.
  ///
  /// In en, this message translates to:
  /// **'When you place an order you can track it here.'**
  String get basketNoOngoingMessage;

  /// No description provided for @basketNoCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'No past orders yet'**
  String get basketNoCompletedTitle;

  /// No description provided for @basketNoCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Orders you\'ve received will be listed here.'**
  String get basketNoCompletedMessage;

  /// No description provided for @basketOrderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order {number}'**
  String basketOrderNumber(String number);

  /// No description provided for @basketTrackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track order'**
  String get basketTrackOrder;

  /// No description provided for @basketReorder.
  ///
  /// In en, this message translates to:
  /// **'Order again'**
  String get basketReorder;

  /// No description provided for @basketViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get basketViewDetails;

  /// No description provided for @basketSignInMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign in to see your ongoing and past orders.'**
  String get basketSignInMessage;

  /// No description provided for @basketViewTimeline.
  ///
  /// In en, this message translates to:
  /// **'View timeline'**
  String get basketViewTimeline;

  /// No description provided for @basketOrderEta.
  ///
  /// In en, this message translates to:
  /// **'{status} · arriving {time}'**
  String basketOrderEta(String status, String time);

  /// No description provided for @basketRemoved.
  ///
  /// In en, this message translates to:
  /// **'{store} basket removed'**
  String basketRemoved(String store);

  /// No description provided for @basketUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get basketUndo;

  /// No description provided for @cartAdded.
  ///
  /// In en, this message translates to:
  /// **'Added to your basket'**
  String get cartAdded;

  /// No description provided for @cartViewBasket.
  ///
  /// In en, this message translates to:
  /// **'View basket'**
  String get cartViewBasket;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @checkoutHideSelections.
  ///
  /// In en, this message translates to:
  /// **'Hide selections'**
  String get checkoutHideSelections;

  /// No description provided for @checkoutShowSelections.
  ///
  /// In en, this message translates to:
  /// **'Show selections'**
  String get checkoutShowSelections;

  /// No description provided for @checkoutPack.
  ///
  /// In en, this message translates to:
  /// **'Pack {number}'**
  String checkoutPack(int number);

  /// No description provided for @checkoutYourSelections.
  ///
  /// In en, this message translates to:
  /// **'Your Selections'**
  String get checkoutYourSelections;

  /// No description provided for @checkoutEditSelection.
  ///
  /// In en, this message translates to:
  /// **'Edit selection'**
  String get checkoutEditSelection;

  /// No description provided for @checkoutAddAnotherItem.
  ///
  /// In en, this message translates to:
  /// **'Add another item'**
  String get checkoutAddAnotherItem;

  /// No description provided for @checkoutDeliveryInfo.
  ///
  /// In en, this message translates to:
  /// **'Delivery Info'**
  String get checkoutDeliveryInfo;

  /// No description provided for @checkoutDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get checkoutDelivery;

  /// No description provided for @checkoutPickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get checkoutPickup;

  /// No description provided for @checkoutMiles.
  ///
  /// In en, this message translates to:
  /// **'{distance} miles'**
  String checkoutMiles(String distance);

  /// No description provided for @checkoutChooseAddress.
  ///
  /// In en, this message translates to:
  /// **'Choose a delivery address'**
  String get checkoutChooseAddress;

  /// No description provided for @checkoutDeliveryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Delivery instructions'**
  String get checkoutDeliveryInstructions;

  /// No description provided for @checkoutDeliveryInstructionsHint.
  ///
  /// In en, this message translates to:
  /// **'Add specific information to the rider'**
  String get checkoutDeliveryInstructionsHint;

  /// No description provided for @checkoutAllergyInfo.
  ///
  /// In en, this message translates to:
  /// **'Allergy & Dietary Info'**
  String get checkoutAllergyInfo;

  /// No description provided for @checkoutAllergyInformation.
  ///
  /// In en, this message translates to:
  /// **'Allergy Information'**
  String get checkoutAllergyInformation;

  /// No description provided for @checkoutDietaryLabels.
  ///
  /// In en, this message translates to:
  /// **'Dietary Labels'**
  String get checkoutDietaryLabels;

  /// No description provided for @checkoutDeliversIn.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =1{Delivers in 1 min} other{Delivers in {minutes} mins}}'**
  String checkoutDeliversIn(int minutes);

  /// No description provided for @checkoutStoreLocation.
  ///
  /// In en, this message translates to:
  /// **'Store location'**
  String get checkoutStoreLocation;

  /// No description provided for @checkoutDistance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get checkoutDistance;

  /// No description provided for @checkoutPickupTime.
  ///
  /// In en, this message translates to:
  /// **'Pickup time'**
  String get checkoutPickupTime;

  /// No description provided for @checkoutPickupWindow.
  ///
  /// In en, this message translates to:
  /// **'{from} - {to} mins'**
  String checkoutPickupWindow(int from, int to);

  /// No description provided for @checkoutPaymentOption.
  ///
  /// In en, this message translates to:
  /// **'Choose your payment option'**
  String get checkoutPaymentOption;

  /// No description provided for @checkoutPayWithWallet.
  ///
  /// In en, this message translates to:
  /// **'Pay with wallet'**
  String get checkoutPayWithWallet;

  /// No description provided for @checkoutWalletBalance.
  ///
  /// In en, this message translates to:
  /// **'Bal: {balance}'**
  String checkoutWalletBalance(String balance);

  /// No description provided for @checkoutPayWithCard.
  ///
  /// In en, this message translates to:
  /// **'Use credit or debit card'**
  String get checkoutPayWithCard;

  /// No description provided for @checkoutWalletTooLow.
  ///
  /// In en, this message translates to:
  /// **'Balance too low for this order'**
  String get checkoutWalletTooLow;

  /// No description provided for @checkoutCutlery.
  ///
  /// In en, this message translates to:
  /// **'Request cutlery or straws'**
  String get checkoutCutlery;

  /// No description provided for @checkoutSendAsGift.
  ///
  /// In en, this message translates to:
  /// **'Send as gift'**
  String get checkoutSendAsGift;

  /// No description provided for @checkoutGiftFor.
  ///
  /// In en, this message translates to:
  /// **'Gift for {name}'**
  String checkoutGiftFor(String name);

  /// No description provided for @checkoutGiftSaved.
  ///
  /// In en, this message translates to:
  /// **'Gift details saved'**
  String get checkoutGiftSaved;

  /// No description provided for @checkoutPaymentSummary.
  ///
  /// In en, this message translates to:
  /// **'Payment summary'**
  String get checkoutPaymentSummary;

  /// No description provided for @checkoutSubtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get checkoutSubtotal;

  /// No description provided for @checkoutDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get checkoutDeliveryFee;

  /// No description provided for @checkoutServiceFee.
  ///
  /// In en, this message translates to:
  /// **'Service fee'**
  String get checkoutServiceFee;

  /// No description provided for @checkoutDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount applied'**
  String get checkoutDiscount;

  /// No description provided for @checkoutTotal.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get checkoutTotal;

  /// No description provided for @checkoutMakePayment.
  ///
  /// In en, this message translates to:
  /// **'Make payment'**
  String get checkoutMakePayment;

  /// No description provided for @checkoutClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear this basket?'**
  String get checkoutClearTitle;

  /// No description provided for @checkoutClearMessage.
  ///
  /// In en, this message translates to:
  /// **'All items from {store} will be removed.'**
  String checkoutClearMessage(String store);

  /// No description provided for @checkoutClearConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear basket'**
  String get checkoutClearConfirm;

  /// No description provided for @checkoutRemovePackTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove this pack?'**
  String get checkoutRemovePackTitle;

  /// No description provided for @checkoutRemovePackMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} will be removed from your basket.'**
  String checkoutRemovePackMessage(String name);

  /// No description provided for @checkoutInstructionsHint.
  ///
  /// In en, this message translates to:
  /// **'Leave a message...'**
  String get checkoutInstructionsHint;

  /// No description provided for @checkoutAddNote.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get checkoutAddNote;

  /// No description provided for @checkoutGiftTitle.
  ///
  /// In en, this message translates to:
  /// **'Customize your gift'**
  String get checkoutGiftTitle;

  /// No description provided for @checkoutGiftSender.
  ///
  /// In en, this message translates to:
  /// **'Who is sending this gift?'**
  String get checkoutGiftSender;

  /// No description provided for @checkoutGiftRecipient.
  ///
  /// In en, this message translates to:
  /// **'Who is this gift for?'**
  String get checkoutGiftRecipient;

  /// No description provided for @checkoutGiftRecipientHint.
  ///
  /// In en, this message translates to:
  /// **'Enter their name or nickname'**
  String get checkoutGiftRecipientHint;

  /// No description provided for @checkoutGiftPhone.
  ///
  /// In en, this message translates to:
  /// **'Recipient’s phone number'**
  String get checkoutGiftPhone;

  /// No description provided for @checkoutGiftFindContacts.
  ///
  /// In en, this message translates to:
  /// **'Find from contacts'**
  String get checkoutGiftFindContacts;

  /// No description provided for @checkoutGiftNote.
  ///
  /// In en, this message translates to:
  /// **'Add a note'**
  String get checkoutGiftNote;

  /// No description provided for @checkoutGiftSave.
  ///
  /// In en, this message translates to:
  /// **'Save gift'**
  String get checkoutGiftSave;

  /// No description provided for @checkoutGiftRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove gift'**
  String get checkoutGiftRemove;

  /// No description provided for @checkoutContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a contact'**
  String get checkoutContactsTitle;

  /// No description provided for @checkoutEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your basket is empty'**
  String get checkoutEmptyTitle;

  /// No description provided for @checkoutEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a few dishes to check out.'**
  String get checkoutEmptyMessage;

  /// No description provided for @checkoutBackToStore.
  ///
  /// In en, this message translates to:
  /// **'Back to store'**
  String get checkoutBackToStore;

  /// No description provided for @checkoutUseCard.
  ///
  /// In en, this message translates to:
  /// **'Use card'**
  String get checkoutUseCard;

  /// No description provided for @checkoutClosedBanner.
  ///
  /// In en, this message translates to:
  /// **'{store} is closed right now. It opens at {time}.'**
  String checkoutClosedBanner(String store, String time);

  /// No description provided for @checkoutCountryPicker.
  ///
  /// In en, this message translates to:
  /// **'Select country'**
  String get checkoutCountryPicker;

  /// No description provided for @checkoutCountrySearch.
  ///
  /// In en, this message translates to:
  /// **'Search country'**
  String get checkoutCountrySearch;

  /// No description provided for @checkoutQuoteFailed.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t update your total. Try again before paying.'**
  String get checkoutQuoteFailed;

  /// No description provided for @checkoutTopUp.
  ///
  /// In en, this message translates to:
  /// **'Top up'**
  String get checkoutTopUp;

  /// No description provided for @checkoutWalletBlocked.
  ///
  /// In en, this message translates to:
  /// **'Top up your wallet or pay by card to continue.'**
  String get checkoutWalletBlocked;

  /// No description provided for @checkoutClosedShort.
  ///
  /// In en, this message translates to:
  /// **'{store} is closed · opens at {time}'**
  String checkoutClosedShort(String store, String time);

  /// No description provided for @homeNow.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get homeNow;

  /// No description provided for @homeAddAddress.
  ///
  /// In en, this message translates to:
  /// **'Add a delivery address'**
  String get homeAddAddress;

  /// No description provided for @homeFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get homeFilter;

  /// No description provided for @homeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search African dishes and restaurants'**
  String get homeSearchHint;

  /// No description provided for @homeFilterDiscounts.
  ///
  /// In en, this message translates to:
  /// **'Discounts'**
  String get homeFilterDiscounts;

  /// No description provided for @homeFilterCuisines.
  ///
  /// In en, this message translates to:
  /// **'Cuisines'**
  String get homeFilterCuisines;

  /// No description provided for @homeFilterTopRated.
  ///
  /// In en, this message translates to:
  /// **'Top-rated'**
  String get homeFilterTopRated;

  /// No description provided for @homeFilterUnder30.
  ///
  /// In en, this message translates to:
  /// **'Under 30 min'**
  String get homeFilterUnder30;

  /// No description provided for @homeFilterDietary.
  ///
  /// In en, this message translates to:
  /// **'Dietary'**
  String get homeFilterDietary;

  /// No description provided for @homeFilterDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get homeFilterDeliveryFee;

  /// No description provided for @homeFilterOffers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get homeFilterOffers;

  /// No description provided for @homeCuisinesTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your favourite cuisines'**
  String get homeCuisinesTitle;

  /// No description provided for @homeDietaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Dietary'**
  String get homeDietaryTitle;

  /// No description provided for @homeDeliveryFeeTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get homeDeliveryFeeTitle;

  /// No description provided for @homeChangeLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Change location to..'**
  String get homeChangeLocationTitle;

  /// No description provided for @homeSearchElsewhere.
  ///
  /// In en, this message translates to:
  /// **'Search someplace else'**
  String get homeSearchElsewhere;

  /// No description provided for @homeUseCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Use my current location'**
  String get homeUseCurrentLocation;

  /// No description provided for @homeNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No places match your filters'**
  String get homeNoResultsTitle;

  /// No description provided for @homeNoResultsMessage.
  ///
  /// In en, this message translates to:
  /// **'Try removing a filter or two'**
  String get homeNoResultsMessage;

  /// No description provided for @homeListEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get homeListEmptyTitle;

  /// No description provided for @homeListEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'New places are joining Tavada every week.'**
  String get homeListEmptyMessage;

  /// No description provided for @homeNoStoresTitle.
  ///
  /// In en, this message translates to:
  /// **'We’re not in your area yet'**
  String get homeNoStoresTitle;

  /// No description provided for @homeNoStoresMessage.
  ///
  /// In en, this message translates to:
  /// **'No stores deliver to this address yet. Try another address.'**
  String get homeNoStoresMessage;

  /// No description provided for @homeChangeAddress.
  ///
  /// In en, this message translates to:
  /// **'Change address'**
  String get homeChangeAddress;

  /// No description provided for @locationIntroShout.
  ///
  /// In en, this message translates to:
  /// **'Howfa naw!'**
  String get locationIntroShout;

  /// No description provided for @locationIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Where do you stay?'**
  String get locationIntroTitle;

  /// No description provided for @locationIntroBody.
  ///
  /// In en, this message translates to:
  /// **'Help us know your location so that we can show you nearby places you can order from'**
  String get locationIntroBody;

  /// No description provided for @locationFindMe.
  ///
  /// In en, this message translates to:
  /// **'Find me'**
  String get locationFindMe;

  /// No description provided for @locationSearchInstead.
  ///
  /// In en, this message translates to:
  /// **'Search for an address instead'**
  String get locationSearchInstead;

  /// No description provided for @locationPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose location'**
  String get locationPickerTitle;

  /// No description provided for @locationSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search here or move map'**
  String get locationSearchHint;

  /// No description provided for @locationDragHint.
  ///
  /// In en, this message translates to:
  /// **'Drag the map to your preferred location'**
  String get locationDragHint;

  /// No description provided for @locationConfirmCurrent.
  ///
  /// In en, this message translates to:
  /// **'Confirm your current location'**
  String get locationConfirmCurrent;

  /// No description provided for @locationSelect.
  ///
  /// In en, this message translates to:
  /// **'Select this location'**
  String get locationSelect;

  /// No description provided for @locationResolving.
  ///
  /// In en, this message translates to:
  /// **'Finding address…'**
  String get locationResolving;

  /// No description provided for @locationDroppedPin.
  ///
  /// In en, this message translates to:
  /// **'Dropped pin'**
  String get locationDroppedPin;

  /// No description provided for @locationRecenter.
  ///
  /// In en, this message translates to:
  /// **'Recenter'**
  String get locationRecenter;

  /// No description provided for @locationNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No places found'**
  String get locationNoResultsTitle;

  /// No description provided for @locationNoResultsMessage.
  ///
  /// In en, this message translates to:
  /// **'Try a street, area or postcode'**
  String get locationNoResultsMessage;

  /// No description provided for @locationSearchEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Where should we deliver?'**
  String get locationSearchEmptyTitle;

  /// No description provided for @locationSearchEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Search for a street, area or postcode'**
  String get locationSearchEmptyMessage;

  /// No description provided for @locationUseCurrent.
  ///
  /// In en, this message translates to:
  /// **'Use my current location'**
  String get locationUseCurrent;

  /// No description provided for @locationServiceDisabledTitle.
  ///
  /// In en, this message translates to:
  /// **'Location is turned off'**
  String get locationServiceDisabledTitle;

  /// No description provided for @locationServiceDisabledMessage.
  ///
  /// In en, this message translates to:
  /// **'Turn on location services to find restaurants near you, or pick your address on the map.'**
  String get locationServiceDisabledMessage;

  /// No description provided for @locationDeniedForeverTitle.
  ///
  /// In en, this message translates to:
  /// **'Location access is off'**
  String get locationDeniedForeverTitle;

  /// No description provided for @locationDeniedForeverMessage.
  ///
  /// In en, this message translates to:
  /// **'Allow location access for Tavada Eats in Settings, or pick your address on the map.'**
  String get locationDeniedForeverMessage;

  /// No description provided for @locationOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get locationOpenSettings;

  /// No description provided for @locationChooseOnMap.
  ///
  /// In en, this message translates to:
  /// **'Choose on map'**
  String get locationChooseOnMap;

  /// No description provided for @locationFallbackToast.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t get your location, so we\'ve started you in London.'**
  String get locationFallbackToast;

  /// No description provided for @locationDeliveringTo.
  ///
  /// In en, this message translates to:
  /// **'Delivering to {address}'**
  String locationDeliveringTo(String address);

  /// No description provided for @locationPinnedTitle.
  ///
  /// In en, this message translates to:
  /// **'Pinned location'**
  String get locationPinnedTitle;

  /// No description provided for @locationResolveFailed.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t look up this address. You can still use the pin.'**
  String get locationResolveFailed;

  /// No description provided for @onboardingContinueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get onboardingContinueAsGuest;

  /// No description provided for @onboardingHeadlineTop.
  ///
  /// In en, this message translates to:
  /// **'ALWAYS AFRICAN'**
  String get onboardingHeadlineTop;

  /// No description provided for @onboardingHeadlineBottom.
  ///
  /// In en, this message translates to:
  /// **'ANYWHERE'**
  String get onboardingHeadlineBottom;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get onboardingLogIn;

  /// No description provided for @onboardingContinueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get onboardingContinueWithApple;

  /// No description provided for @onboardingContinueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get onboardingContinueWithGoogle;

  /// No description provided for @onboardingContinueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get onboardingContinueWithEmail;

  /// No description provided for @onboardingAppleSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Apple'**
  String get onboardingAppleSignIn;

  /// No description provided for @onboardingGoogleSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get onboardingGoogleSignIn;

  /// No description provided for @ordersHangTight.
  ///
  /// In en, this message translates to:
  /// **'Hang tight, we are on it'**
  String get ordersHangTight;

  /// No description provided for @ordersEstimatedArrival.
  ///
  /// In en, this message translates to:
  /// **'Estimated arrival'**
  String get ordersEstimatedArrival;

  /// No description provided for @ordersStatusPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get ordersStatusPlaced;

  /// No description provided for @ordersStatusPreparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing order'**
  String get ordersStatusPreparing;

  /// No description provided for @ordersStatusRiderPicked.
  ///
  /// In en, this message translates to:
  /// **'Rider picks order'**
  String get ordersStatusRiderPicked;

  /// No description provided for @ordersStatusDispatched.
  ///
  /// In en, this message translates to:
  /// **'Order dispatched'**
  String get ordersStatusDispatched;

  /// No description provided for @ordersStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get ordersStatusDelivered;

  /// No description provided for @ordersStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get ordersStatusCancelled;

  /// No description provided for @ordersCallRider.
  ///
  /// In en, this message translates to:
  /// **'Call rider'**
  String get ordersCallRider;

  /// No description provided for @ordersDeliveryInfo.
  ///
  /// In en, this message translates to:
  /// **'Delivery Info'**
  String get ordersDeliveryInfo;

  /// No description provided for @ordersAddress.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get ordersAddress;

  /// No description provided for @ordersPickupFrom.
  ///
  /// In en, this message translates to:
  /// **'Pickup from'**
  String get ordersPickupFrom;

  /// No description provided for @ordersInstruction.
  ///
  /// In en, this message translates to:
  /// **'Delivery instruction'**
  String get ordersInstruction;

  /// No description provided for @ordersNoInstruction.
  ///
  /// In en, this message translates to:
  /// **'No instructions for the rider'**
  String get ordersNoInstruction;

  /// No description provided for @ordersChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get ordersChange;

  /// No description provided for @ordersEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get ordersEdit;

  /// No description provided for @ordersChangeAfterPlacing.
  ///
  /// In en, this message translates to:
  /// **'This order is already on its way. Chat with us to change the delivery details.'**
  String get ordersChangeAfterPlacing;

  /// No description provided for @ordersChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get ordersChat;

  /// No description provided for @ordersSummary.
  ///
  /// In en, this message translates to:
  /// **'Order summary'**
  String get ordersSummary;

  /// No description provided for @ordersPaymentDetails.
  ///
  /// In en, this message translates to:
  /// **'Payment details'**
  String get ordersPaymentDetails;

  /// No description provided for @ordersPaymentSummary.
  ///
  /// In en, this message translates to:
  /// **'Payment summary'**
  String get ordersPaymentSummary;

  /// No description provided for @ordersArrivedIn.
  ///
  /// In en, this message translates to:
  /// **'{minutes, plural, =1{Yay! Your food arrived in just 1 min} other{Yay! Your food arrived in just {minutes} mins}}'**
  String ordersArrivedIn(int minutes);

  /// No description provided for @ordersRateBy.
  ///
  /// In en, this message translates to:
  /// **'Rate your delivery by '**
  String get ordersRateBy;

  /// No description provided for @ordersThanksRating.
  ///
  /// In en, this message translates to:
  /// **'Thanks for rating your delivery!'**
  String get ordersThanksRating;

  /// No description provided for @ordersRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat order'**
  String get ordersRepeat;

  /// No description provided for @ordersRepeated.
  ///
  /// In en, this message translates to:
  /// **'Added to your basket'**
  String get ordersRepeated;

  /// No description provided for @ordersTimeOfDelivery.
  ///
  /// In en, this message translates to:
  /// **'Time of delivery'**
  String get ordersTimeOfDelivery;

  /// No description provided for @ordersEstimatedDelivery.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery'**
  String get ordersEstimatedDelivery;

  /// No description provided for @ordersMilestoneConfirmed.
  ///
  /// In en, this message translates to:
  /// **'{store} has confirmed your order'**
  String ordersMilestoneConfirmed(String store);

  /// No description provided for @ordersMilestoneRiderAssigned.
  ///
  /// In en, this message translates to:
  /// **'A rider has been assigned to your order'**
  String get ordersMilestoneRiderAssigned;

  /// No description provided for @ordersMilestoneReady.
  ///
  /// In en, this message translates to:
  /// **'Your order is ready to be picked by the rider'**
  String get ordersMilestoneReady;

  /// No description provided for @ordersMilestonePickedUp.
  ///
  /// In en, this message translates to:
  /// **'The rider has picked up your order'**
  String get ordersMilestonePickedUp;

  /// No description provided for @ordersMilestoneArrived.
  ///
  /// In en, this message translates to:
  /// **'The rider arrived at your location'**
  String get ordersMilestoneArrived;

  /// No description provided for @ordersViewTimeline.
  ///
  /// In en, this message translates to:
  /// **'View timeline'**
  String get ordersViewTimeline;

  /// No description provided for @ordersGiftFor.
  ///
  /// In en, this message translates to:
  /// **'Gift for {name}'**
  String ordersGiftFor(String name);

  /// No description provided for @ordersRepeatTitle.
  ///
  /// In en, this message translates to:
  /// **'You already have a {store} basket'**
  String ordersRepeatTitle(String store);

  /// No description provided for @ordersRepeatMessage.
  ///
  /// In en, this message translates to:
  /// **'Replace it with this order, or add these items to it?'**
  String get ordersRepeatMessage;

  /// No description provided for @ordersRepeatReplace.
  ///
  /// In en, this message translates to:
  /// **'Replace basket'**
  String get ordersRepeatReplace;

  /// No description provided for @ordersRepeatAdd.
  ///
  /// In en, this message translates to:
  /// **'Add to basket'**
  String get ordersRepeatAdd;

  /// No description provided for @ordersRepeatUnavailable.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item is no longer available and was left out} other{{count} items are no longer available and were left out}}'**
  String ordersRepeatUnavailable(int count);

  /// No description provided for @ordersNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Need help with this order?'**
  String get ordersNeedHelp;

  /// No description provided for @profileGuest.
  ///
  /// In en, this message translates to:
  /// **'Hi there!'**
  String get profileGuest;

  /// No description provided for @profileGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign in to see your wallet, rewards and orders.'**
  String get profileGuestMessage;

  /// No description provided for @profileSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in or create account'**
  String get profileSignIn;

  /// No description provided for @profileWalletBalance.
  ///
  /// In en, this message translates to:
  /// **'Wallet Balance'**
  String get profileWalletBalance;

  /// No description provided for @profileAddMoney.
  ///
  /// In en, this message translates to:
  /// **'Add funds'**
  String get profileAddMoney;

  /// No description provided for @profileSeeActivity.
  ///
  /// In en, this message translates to:
  /// **'See activity'**
  String get profileSeeActivity;

  /// No description provided for @profileUpdatePhone.
  ///
  /// In en, this message translates to:
  /// **'Update phone number'**
  String get profileUpdatePhone;

  /// No description provided for @profileChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get profileChangePassword;

  /// No description provided for @profileNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notification preferences'**
  String get profileNotifications;

  /// No description provided for @profileRewards.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get profileRewards;

  /// No description provided for @profileAccessibility.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get profileAccessibility;

  /// No description provided for @profileHelp.
  ///
  /// In en, this message translates to:
  /// **'Get help'**
  String get profileHelp;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profileLanguage;

  /// No description provided for @profileHaptics.
  ///
  /// In en, this message translates to:
  /// **'Haptic feedback'**
  String get profileHaptics;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get profileLogout;

  /// No description provided for @profileLogoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Log out?'**
  String get profileLogoutTitle;

  /// No description provided for @profileLogoutMessage.
  ///
  /// In en, this message translates to:
  /// **'You can sign back in any time. Your baskets stay on this device.'**
  String get profileLogoutMessage;

  /// No description provided for @profilePointsToNext.
  ///
  /// In en, this message translates to:
  /// **'{points} pts'**
  String profilePointsToNext(String points);

  /// No description provided for @profilePointsToNextSuffix.
  ///
  /// In en, this message translates to:
  /// **' more to next reward'**
  String get profilePointsToNextSuffix;

  /// No description provided for @profileEarnReward.
  ///
  /// In en, this message translates to:
  /// **'Earn {value} when you reach {points} pts'**
  String profileEarnReward(String value, String points);

  /// No description provided for @profileRedeemPoints.
  ///
  /// In en, this message translates to:
  /// **'Redeem points'**
  String get profileRedeemPoints;

  /// No description provided for @profileReferFriend.
  ///
  /// In en, this message translates to:
  /// **'Refer a friend,\nget {points}pts'**
  String profileReferFriend(String points);

  /// No description provided for @profileRedeemed.
  ///
  /// In en, this message translates to:
  /// **'{value} added to your wallet!'**
  String profileRedeemed(String value);

  /// No description provided for @profileVersion.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String profileVersion(String version);

  /// No description provided for @updatePhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Update your phone number?'**
  String get updatePhoneTitle;

  /// No description provided for @updatePhoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You\'ll use this number to get notifications, sign in, and recover account'**
  String get updatePhoneSubtitle;

  /// No description provided for @updatePhoneSaved.
  ///
  /// In en, this message translates to:
  /// **'Phone number updated'**
  String get updatePhoneSaved;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change your password'**
  String get changePasswordTitle;

  /// No description provided for @changePasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password, then choose a new one'**
  String get changePasswordSubtitle;

  /// No description provided for @changePasswordSaved.
  ///
  /// In en, this message translates to:
  /// **'Password changed'**
  String get changePasswordSaved;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification preferences'**
  String get notificationsTitle;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how you would like to get notified for special offers, promos, and more'**
  String get notificationsSubtitle;

  /// No description provided for @notificationsPush.
  ///
  /// In en, this message translates to:
  /// **'Push notifications'**
  String get notificationsPush;

  /// No description provided for @notificationsWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get notificationsWhatsapp;

  /// No description provided for @notificationsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get notificationsEmail;

  /// No description provided for @notificationsOn.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get notificationsOn;

  /// No description provided for @notificationsOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get notificationsOff;

  /// No description provided for @notificationsCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get notificationsCategoriesTitle;

  /// No description provided for @notificationsOrderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order Status Update'**
  String get notificationsOrderStatus;

  /// No description provided for @notificationsOrderStatusBody.
  ///
  /// In en, this message translates to:
  /// **'Allow to send notifications and show live order tracking updates'**
  String get notificationsOrderStatusBody;

  /// No description provided for @notificationsPromotions.
  ///
  /// In en, this message translates to:
  /// **'Promotional Notifications'**
  String get notificationsPromotions;

  /// No description provided for @notificationsPromotionsBody.
  ///
  /// In en, this message translates to:
  /// **'Notify me about exclusive offers, money saving offers, and promotions'**
  String get notificationsPromotionsBody;

  /// No description provided for @notificationsRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get notificationsRecommendations;

  /// No description provided for @notificationsRecommendationsBody.
  ///
  /// In en, this message translates to:
  /// **'Let me know about recommendations on great food, groceries and more'**
  String get notificationsRecommendationsBody;

  /// No description provided for @notificationsReminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get notificationsReminders;

  /// No description provided for @notificationsRemindersBody.
  ///
  /// In en, this message translates to:
  /// **'Notify me for unfinished orders'**
  String get notificationsRemindersBody;

  /// No description provided for @notificationsSaved.
  ///
  /// In en, this message translates to:
  /// **'Preferences saved'**
  String get notificationsSaved;

  /// No description provided for @accessibilityTitle.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get accessibilityTitle;

  /// No description provided for @accessibilitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help riders and stores serve you better'**
  String get accessibilitySubtitle;

  /// No description provided for @accessibilityHearing.
  ///
  /// In en, this message translates to:
  /// **'Hearing'**
  String get accessibilityHearing;

  /// No description provided for @accessibilityHearingBody.
  ///
  /// In en, this message translates to:
  /// **'Choose to disclose to riders whether you are deaf or have difficulty hearing'**
  String get accessibilityHearingBody;

  /// No description provided for @accessibilityHearingNone.
  ///
  /// In en, this message translates to:
  /// **'I am not deaf or hard of hearing'**
  String get accessibilityHearingNone;

  /// No description provided for @accessibilityHearingDeaf.
  ///
  /// In en, this message translates to:
  /// **'I am deaf'**
  String get accessibilityHearingDeaf;

  /// No description provided for @accessibilityHearingHard.
  ///
  /// In en, this message translates to:
  /// **'I am hard of hearing'**
  String get accessibilityHearingHard;

  /// No description provided for @accessibilitySaved.
  ///
  /// In en, this message translates to:
  /// **'Accessibility settings saved'**
  String get accessibilitySaved;

  /// No description provided for @addMoneyTitle.
  ///
  /// In en, this message translates to:
  /// **'Add money'**
  String get addMoneyTitle;

  /// No description provided for @addMoneyBalance.
  ///
  /// In en, this message translates to:
  /// **'Balance: {balance}'**
  String addMoneyBalance(String balance);

  /// No description provided for @addMoneySecurely.
  ///
  /// In en, this message translates to:
  /// **'Add money securely'**
  String get addMoneySecurely;

  /// No description provided for @addMoneySuccess.
  ///
  /// In en, this message translates to:
  /// **'{amount} added to your wallet'**
  String addMoneySuccess(String amount);

  /// No description provided for @walletActivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Wallet activity'**
  String get walletActivityTitle;

  /// No description provided for @walletEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No activity yet'**
  String get walletEmptyTitle;

  /// No description provided for @walletEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Top-ups, payments and refunds will show up here.'**
  String get walletEmptyMessage;

  /// No description provided for @walletTopUp.
  ///
  /// In en, this message translates to:
  /// **'Wallet top-up'**
  String get walletTopUp;

  /// No description provided for @walletPayment.
  ///
  /// In en, this message translates to:
  /// **'Order payment'**
  String get walletPayment;

  /// No description provided for @walletRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get walletRefund;

  /// No description provided for @walletReward.
  ///
  /// In en, this message translates to:
  /// **'Reward'**
  String get walletReward;

  /// No description provided for @rewardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Rewards'**
  String get rewardsTitle;

  /// No description provided for @rewardsPoints.
  ///
  /// In en, this message translates to:
  /// **'{points} pts'**
  String rewardsPoints(String points);

  /// No description provided for @rewardsYourPoints.
  ///
  /// In en, this message translates to:
  /// **'Your points'**
  String get rewardsYourPoints;

  /// No description provided for @rewardsHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get rewardsHowItWorks;

  /// No description provided for @rewardsHow1.
  ///
  /// In en, this message translates to:
  /// **'Earn 10 points for every £1 you spend.'**
  String get rewardsHow1;

  /// No description provided for @rewardsHow2.
  ///
  /// In en, this message translates to:
  /// **'Redeem {points} points for {value} wallet credit.'**
  String rewardsHow2(String points, String value);

  /// No description provided for @rewardsHow3.
  ///
  /// In en, this message translates to:
  /// **'Invite friends with your code — you both get {points} points.'**
  String rewardsHow3(String points);

  /// No description provided for @rewardsReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Your referral code'**
  String get rewardsReferralCode;

  /// No description provided for @rewardsShare.
  ///
  /// In en, this message translates to:
  /// **'Share code'**
  String get rewardsShare;

  /// No description provided for @rewardsShareText.
  ///
  /// In en, this message translates to:
  /// **'Join me on Tavada Eats with my code {code} and we both get bonus points!'**
  String rewardsShareText(String code);

  /// No description provided for @rewardsCopied.
  ///
  /// In en, this message translates to:
  /// **'Code copied'**
  String get rewardsCopied;

  /// No description provided for @languageTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageTitle;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the language for the app'**
  String get languageSubtitle;

  /// No description provided for @changePasswordCurrentHint.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get changePasswordCurrentHint;

  /// No description provided for @changePasswordNewHint.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get changePasswordNewHint;

  /// No description provided for @updatePhoneCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code we sent you'**
  String get updatePhoneCodeTitle;

  /// No description provided for @updatePhoneCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a 4-digit code to {phone} to make sure it’s yours'**
  String updatePhoneCodeSubtitle(String phone);

  /// No description provided for @updatePhoneVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify and save'**
  String get updatePhoneVerify;

  /// No description provided for @profileEditName.
  ///
  /// In en, this message translates to:
  /// **'Edit your name'**
  String get profileEditName;

  /// No description provided for @profileEditNameSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This is how stores and riders will greet you'**
  String get profileEditNameSubtitle;

  /// No description provided for @profileNameSaved.
  ///
  /// In en, this message translates to:
  /// **'Name updated'**
  String get profileNameSaved;

  /// No description provided for @profileEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit name'**
  String get profileEditProfile;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get profileDeleteAccount;

  /// No description provided for @profileDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete your account?'**
  String get profileDeleteTitle;

  /// No description provided for @profileDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your account, order history, wallet balance and reward points. It can’t be undone.'**
  String get profileDeleteMessage;

  /// No description provided for @profileDeleteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get profileDeleteConfirm;

  /// No description provided for @profileDeleted.
  ///
  /// In en, this message translates to:
  /// **'Your account has been deleted'**
  String get profileDeleted;

  /// No description provided for @addMoneyMinimum.
  ///
  /// In en, this message translates to:
  /// **'Minimum top-up is {amount} · charged to {card}'**
  String addMoneyMinimum(String amount, String card);

  /// No description provided for @rewardsPointsSuffix.
  ///
  /// In en, this message translates to:
  /// **' pts'**
  String get rewardsPointsSuffix;

  /// No description provided for @restaurantComments.
  ///
  /// In en, this message translates to:
  /// **'{count} comments'**
  String restaurantComments(int count);

  /// No description provided for @restaurantDeliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get restaurantDeliveryTime;

  /// No description provided for @restaurantCuisine.
  ///
  /// In en, this message translates to:
  /// **'Cuisine'**
  String get restaurantCuisine;

  /// No description provided for @restaurantDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get restaurantDeliveryFee;

  /// No description provided for @restaurantAiSummary.
  ///
  /// In en, this message translates to:
  /// **'AI summary'**
  String get restaurantAiSummary;

  /// No description provided for @restaurantAiDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'This summary is automatically generated from customer reviews. We do not guarantee the accuracy, timeliness, or completeness of the information provided.'**
  String get restaurantAiDisclaimer;

  /// No description provided for @restaurantPopularOrders.
  ///
  /// In en, this message translates to:
  /// **'Popular orders'**
  String get restaurantPopularOrders;

  /// No description provided for @restaurantMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get restaurantMenu;

  /// No description provided for @restaurantSearchMenu.
  ///
  /// In en, this message translates to:
  /// **'Search menu'**
  String get restaurantSearchMenu;

  /// No description provided for @restaurantSearchMenuHint.
  ///
  /// In en, this message translates to:
  /// **'Search dishes and drinks'**
  String get restaurantSearchMenuHint;

  /// No description provided for @restaurantSearchMenuMessage.
  ///
  /// In en, this message translates to:
  /// **'Find your favourite dish or drink here'**
  String get restaurantSearchMenuMessage;

  /// No description provided for @restaurantNoDishesTitle.
  ///
  /// In en, this message translates to:
  /// **'No dishes found'**
  String get restaurantNoDishesTitle;

  /// No description provided for @restaurantNoDishesMessage.
  ///
  /// In en, this message translates to:
  /// **'Try a different name or ingredient'**
  String get restaurantNoDishesMessage;

  /// No description provided for @restaurantOpenUntil.
  ///
  /// In en, this message translates to:
  /// **'Open now · Until {time}'**
  String restaurantOpenUntil(String time);

  /// No description provided for @restaurantClosedOpensAt.
  ///
  /// In en, this message translates to:
  /// **'Closed · Opens {time}'**
  String restaurantClosedOpensAt(String time);

  /// No description provided for @restaurantRatingReviews.
  ///
  /// In en, this message translates to:
  /// **'{rating} ({count} reviews)'**
  String restaurantRatingReviews(String rating, int count);

  /// No description provided for @restaurantAllergyInfo.
  ///
  /// In en, this message translates to:
  /// **'Allergy & Dietary Info'**
  String get restaurantAllergyInfo;

  /// No description provided for @restaurantAllergyInformation.
  ///
  /// In en, this message translates to:
  /// **'Allergy Information'**
  String get restaurantAllergyInformation;

  /// No description provided for @restaurantDietaryLabels.
  ///
  /// In en, this message translates to:
  /// **'Dietary Labels'**
  String get restaurantDietaryLabels;

  /// No description provided for @restaurantOrdersCount.
  ///
  /// In en, this message translates to:
  /// **'{count} orders'**
  String restaurantOrdersCount(String count);

  /// No description provided for @restaurantOrdersPeriod.
  ///
  /// In en, this message translates to:
  /// **'in the last 12 months'**
  String get restaurantOrdersPeriod;

  /// No description provided for @restaurantAddressCopied.
  ///
  /// In en, this message translates to:
  /// **'Address copied'**
  String get restaurantAddressCopied;

  /// No description provided for @restaurantMilesAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} miles'**
  String restaurantMilesAway(String distance);

  /// No description provided for @restaurantShareText.
  ///
  /// In en, this message translates to:
  /// **'Order from {name} on Tavada Eats'**
  String restaurantShareText(String name);

  /// No description provided for @restaurantClosedBanner.
  ///
  /// In en, this message translates to:
  /// **'Closed right now. You can still browse the menu.'**
  String get restaurantClosedBanner;

  /// No description provided for @reviewsTitle.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviewsTitle;

  /// No description provided for @reviewsCount.
  ///
  /// In en, this message translates to:
  /// **'{count}+ reviews'**
  String reviewsCount(int count);

  /// No description provided for @reviewsComments.
  ///
  /// In en, this message translates to:
  /// **'Comments'**
  String get reviewsComments;

  /// No description provided for @reviewsRestaurantReply.
  ///
  /// In en, this message translates to:
  /// **'Restaurant\'s Reply'**
  String get reviewsRestaurantReply;

  /// No description provided for @reviewsThanksFeedback.
  ///
  /// In en, this message translates to:
  /// **'Thanks for your feedback'**
  String get reviewsThanksFeedback;

  /// No description provided for @reviewsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get reviewsEmptyTitle;

  /// No description provided for @reviewsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Be the first to order and leave a review.'**
  String get reviewsEmptyMessage;

  /// No description provided for @dishRequired.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get dishRequired;

  /// No description provided for @dishOptional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get dishOptional;

  /// No description provided for @dishChooseUpTo.
  ///
  /// In en, this message translates to:
  /// **'Choose up to {count}'**
  String dishChooseUpTo(int count);

  /// No description provided for @dishAddFor.
  ///
  /// In en, this message translates to:
  /// **'Add for {price}'**
  String dishAddFor(String price);

  /// No description provided for @dishUpdateFor.
  ///
  /// In en, this message translates to:
  /// **'Update order for {price}'**
  String dishUpdateFor(String price);

  /// No description provided for @dishPercentOff.
  ///
  /// In en, this message translates to:
  /// **'{percent}% off'**
  String dishPercentOff(int percent);

  /// No description provided for @dishAllergenNotice.
  ///
  /// In en, this message translates to:
  /// **'Food may contain allergens. Questions for specific allergen information? '**
  String get dishAllergenNotice;

  /// No description provided for @dishContactRestaurant.
  ///
  /// In en, this message translates to:
  /// **'Please contact the restaurant'**
  String get dishContactRestaurant;

  /// No description provided for @dishNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Add a note for the kitchen (optional)'**
  String get dishNoteHint;

  /// No description provided for @dishDeliveryMeta.
  ///
  /// In en, this message translates to:
  /// **'{fee} Delivery fee · {eta}'**
  String dishDeliveryMeta(String fee, String eta);

  /// No description provided for @dishFreeDeliveryMeta.
  ///
  /// In en, this message translates to:
  /// **'Free delivery · {eta}'**
  String dishFreeDeliveryMeta(String eta);

  /// No description provided for @dishChooseRequired.
  ///
  /// In en, this message translates to:
  /// **'Choose an option for “{group}”'**
  String dishChooseRequired(String group);

  /// No description provided for @dishMaxReached.
  ///
  /// In en, this message translates to:
  /// **'You can choose up to {count}'**
  String dishMaxReached(int count);

  /// No description provided for @restaurantClosedBannerAt.
  ///
  /// In en, this message translates to:
  /// **'Closed right now · opens at {time}. You can still browse the menu.'**
  String restaurantClosedBannerAt(String time);

  /// No description provided for @dishNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Special instructions'**
  String get dishNoteTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search African dishes and restaurants'**
  String get searchHint;

  /// No description provided for @searchRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent searches'**
  String get searchRecent;

  /// No description provided for @searchCategories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get searchCategories;

  /// No description provided for @searchTrendyCuisines.
  ///
  /// In en, this message translates to:
  /// **'Trendy cuisines near you'**
  String get searchTrendyCuisines;

  /// No description provided for @searchFor.
  ///
  /// In en, this message translates to:
  /// **'Search for “{query}”'**
  String searchFor(String query);

  /// No description provided for @searchAllAfrica.
  ///
  /// In en, this message translates to:
  /// **'All Africa'**
  String get searchAllAfrica;

  /// No description provided for @searchDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'{fee} Delivery fee'**
  String searchDeliveryFee(String fee);

  /// No description provided for @searchFreeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery'**
  String get searchFreeDelivery;

  /// No description provided for @searchNoResultsTitle.
  ///
  /// In en, this message translates to:
  /// **'No matches for “{query}”'**
  String searchNoResultsTitle(String query);

  /// No description provided for @searchNoResultsMessage.
  ///
  /// In en, this message translates to:
  /// **'Check the spelling or try a different dish, drink or restaurant.'**
  String get searchNoResultsMessage;

  /// No description provided for @helpTitle.
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get helpTitle;

  /// No description provided for @helpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Our team is ready to help you 24/7'**
  String get helpSubtitle;

  /// No description provided for @helpChatWithPerson.
  ///
  /// In en, this message translates to:
  /// **'Chat with a person'**
  String get helpChatWithPerson;

  /// No description provided for @helpWasHelpful.
  ///
  /// In en, this message translates to:
  /// **'Was this helpful?'**
  String get helpWasHelpful;

  /// No description provided for @helpYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get helpYes;

  /// No description provided for @helpNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get helpNo;

  /// No description provided for @helpThanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks for letting us know!'**
  String get helpThanks;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat with support'**
  String get chatTitle;

  /// No description provided for @chatWithAgent.
  ///
  /// In en, this message translates to:
  /// **'Chatting with {name}'**
  String chatWithAgent(String name);

  /// No description provided for @chatEmpty.
  ///
  /// In en, this message translates to:
  /// **'Share your concerns with us, we\'re here to help and make things right!'**
  String get chatEmpty;

  /// No description provided for @chatHint.
  ///
  /// In en, this message translates to:
  /// **'Share your concerns'**
  String get chatHint;

  /// No description provided for @chatSendFailed.
  ///
  /// In en, this message translates to:
  /// **'Message not sent. Tap to retry.'**
  String get chatSendFailed;

  /// No description provided for @chatAttachPhoto.
  ///
  /// In en, this message translates to:
  /// **'Attach a photo'**
  String get chatAttachPhoto;

  /// No description provided for @chatTyping.
  ///
  /// In en, this message translates to:
  /// **'{name} is typing'**
  String chatTyping(String name);

  /// No description provided for @chatPhotoAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'We can’t open your photos. Allow photo access in Settings to send a picture.'**
  String get chatPhotoAccessDenied;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
