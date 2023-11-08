import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
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
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rentify'**
  String get appName;

  /// No description provided for @languageSelect.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageSelect;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @creatPasscode.
  ///
  /// In en, this message translates to:
  /// **'Create passcode'**
  String get creatPasscode;

  /// No description provided for @accountVerificationInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'This info needs to be accurate with your ID document'**
  String get accountVerificationInfoMessage;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @continueText.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueText;

  /// No description provided for @chooseRecipient.
  ///
  /// In en, this message translates to:
  /// **'Choose Recipient'**
  String get chooseRecipient;

  /// No description provided for @receiveMoneyInfoMessage.
  ///
  /// In en, this message translates to:
  /// **'Please select your recipient to receive money'**
  String get receiveMoneyInfoMessage;

  /// No description provided for @searchRecipientEmail.
  ///
  /// In en, this message translates to:
  /// **'Search Recipient Email'**
  String get searchRecipientEmail;

  /// No description provided for @mostRecent.
  ///
  /// In en, this message translates to:
  /// **'Most Recent'**
  String get mostRecent;

  /// No description provided for @scanToPay.
  ///
  /// In en, this message translates to:
  /// **'Scan to Pay'**
  String get scanToPay;

  /// No description provided for @addYourPersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Add your personal info'**
  String get addYourPersonalInfo;

  /// No description provided for @examplEmail.
  ///
  /// In en, this message translates to:
  /// **'name@example.com'**
  String get examplEmail;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get userName;

  /// No description provided for @userSurName.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get userSurName;

  /// No description provided for @userNameHint.
  ///
  /// In en, this message translates to:
  /// **'@username'**
  String get userNameHint;

  /// No description provided for @birthOfDate.
  ///
  /// In en, this message translates to:
  /// **'Birth of Date'**
  String get birthOfDate;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select a Date'**
  String get selectDate;

  /// No description provided for @ageRestriction.
  ///
  /// In en, this message translates to:
  /// **'Age Restriction'**
  String get ageRestriction;

  /// No description provided for @ageValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'You must be over 18 years old'**
  String get ageValidationMessage;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @countryOfResidence.
  ///
  /// In en, this message translates to:
  /// **'Country of Residence'**
  String get countryOfResidence;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @scanToGetPaid.
  ///
  /// In en, this message translates to:
  /// **'Scan to get paid'**
  String get scanToGetPaid;

  /// No description provided for @receiveScanQrMessage.
  ///
  /// In en, this message translates to:
  /// **'Hold the code inside the frame, it will be'**
  String get receiveScanQrMessage;

  /// No description provided for @receiveScanQrMessageAuto.
  ///
  /// In en, this message translates to:
  /// **'automatically scanned'**
  String get receiveScanQrMessageAuto;

  /// No description provided for @requestPayment.
  ///
  /// In en, this message translates to:
  /// **'Request Payment'**
  String get requestPayment;

  /// No description provided for @shareToReceiveMoney.
  ///
  /// In en, this message translates to:
  /// **'Share to Receive Money'**
  String get shareToReceiveMoney;

  /// No description provided for @receivePurposeMoneyMessage.
  ///
  /// In en, this message translates to:
  /// **'Please select the recipient you will receive money from.'**
  String get receivePurposeMoneyMessage;

  /// No description provided for @receivePurposeTextField.
  ///
  /// In en, this message translates to:
  /// **'Search Recipient Email'**
  String get receivePurposeTextField;

  /// No description provided for @selectPurpose.
  ///
  /// In en, this message translates to:
  /// **'Select Purpose'**
  String get selectPurpose;

  /// No description provided for @selectPurposeForSendingMoney.
  ///
  /// In en, this message translates to:
  /// **'Select a purpose for sending money'**
  String get selectPurposeForSendingMoney;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personel Info'**
  String get personalInfo;

  /// No description provided for @bankAndCards.
  ///
  /// In en, this message translates to:
  /// **'Bank & Cards'**
  String get bankAndCards;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @amountToReceive.
  ///
  /// In en, this message translates to:
  /// **'Amount to Receive'**
  String get amountToReceive;

  /// No description provided for @receiveAmountMoneyMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter the amount you want to receive.'**
  String get receiveAmountMoneyMessage;

  /// No description provided for @enterAmount.
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get enterAmount;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// No description provided for @receivePaymentMoneyMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter an amount to receive payment'**
  String get receivePaymentMoneyMessage;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @bank.
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// No description provided for @settingUpYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Setting up your account'**
  String get settingUpYourAccount;

  /// No description provided for @analyzingDataMessage.
  ///
  /// In en, this message translates to:
  /// **'We are analyzing your data to verify'**
  String get analyzingDataMessage;

  /// No description provided for @verifyingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Verifying photo'**
  String get verifyingPhoto;

  /// No description provided for @phoneVerified.
  ///
  /// In en, this message translates to:
  /// **'Phone verified'**
  String get phoneVerified;

  /// No description provided for @checkingUpDocumentID.
  ///
  /// In en, this message translates to:
  /// **'Checking up document ID'**
  String get checkingUpDocumentID;

  /// No description provided for @scanIdDocumnetMessage.
  ///
  /// In en, this message translates to:
  /// **'Scan ID document to verify your identity'**
  String get scanIdDocumnetMessage;

  /// No description provided for @confirmIdMessage.
  ///
  /// In en, this message translates to:
  /// **'Confirm your identity with just a few taps on your phone'**
  String get confirmIdMessage;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @takeSelfieMessage.
  ///
  /// In en, this message translates to:
  /// **'Take selfie to verify your identity'**
  String get takeSelfieMessage;

  /// No description provided for @confirmIDCameraMessage.
  ///
  /// In en, this message translates to:
  /// **'Quick and easy identification verification using your phone\'s camera. Confirm your identity with a self-captured photo'**
  String get confirmIDCameraMessage;

  /// No description provided for @takeSelfie.
  ///
  /// In en, this message translates to:
  /// **'Take a Selfie'**
  String get takeSelfie;

  /// No description provided for @idScanFrontMessage.
  ///
  /// In en, this message translates to:
  /// **'Please scan front of your ID card'**
  String get idScanFrontMessage;

  /// No description provided for @idVerificationMessage.
  ///
  /// In en, this message translates to:
  /// **'ID verification in progress'**
  String get idVerificationMessage;

  /// No description provided for @holdTightMessage.
  ///
  /// In en, this message translates to:
  /// **'Hold tight, it won\'t take long'**
  String get holdTightMessage;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAccount;

  /// No description provided for @accountVerifyMobileNumberMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number to verify your account'**
  String get accountVerifyMobileNumberMessage;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobileNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @verifyPhoneNumberMessage.
  ///
  /// In en, this message translates to:
  /// **'Verify your phone number before we send code'**
  String get verifyPhoneNumberMessage;

  /// No description provided for @isThisCorrect.
  ///
  /// In en, this message translates to:
  /// **'Is this correct?'**
  String get isThisCorrect;

  /// No description provided for @signin.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signin;

  /// No description provided for @coinpayAccount.
  ///
  /// In en, this message translates to:
  /// **'Coinpay account'**
  String get coinpayAccount;

  /// No description provided for @chooseAccount.
  ///
  /// In en, this message translates to:
  /// **'Choose Account'**
  String get chooseAccount;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @pay.
  ///
  /// In en, this message translates to:
  /// **'Pay'**
  String get pay;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @transactionCompleted.
  ///
  /// In en, this message translates to:
  /// **'Transaction Complete'**
  String get transactionCompleted;

  /// No description provided for @backToTheHomePage.
  ///
  /// In en, this message translates to:
  /// **'Back to the Home Page'**
  String get backToTheHomePage;

  /// No description provided for @makeAnotherPayment.
  ///
  /// In en, this message translates to:
  /// **'Make another Payment'**
  String get makeAnotherPayment;

  /// No description provided for @thanksMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for using our app to send money. If you have any questions or concerns, please don\'t hesitate to'**
  String get thanksMessage;

  /// No description provided for @transactionId.
  ///
  /// In en, this message translates to:
  /// **'Coinpay Transaction ID'**
  String get transactionId;

  /// No description provided for @barcodeType.
  ///
  /// In en, this message translates to:
  /// **'Barcode Type'**
  String get barcodeType;

  /// No description provided for @scanQRToPay.
  ///
  /// In en, this message translates to:
  /// **'Scan a QR to Pay'**
  String get scanQRToPay;

  /// No description provided for @spending.
  ///
  /// In en, this message translates to:
  /// **'Spending'**
  String get spending;

  /// No description provided for @totalSpend.
  ///
  /// In en, this message translates to:
  /// **'Total Spend'**
  String get totalSpend;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @bills.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get bills;

  /// No description provided for @savings.
  ///
  /// In en, this message translates to:
  /// **'Savings'**
  String get savings;

  /// No description provided for @spendingList.
  ///
  /// In en, this message translates to:
  /// **'Spending List'**
  String get spendingList;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @dailySpendingLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily Spending Limit'**
  String get dailySpendingLimit;

  /// No description provided for @weeklySpendingLimit.
  ///
  /// In en, this message translates to:
  /// **'Weekly Spending Limit'**
  String get weeklySpendingLimit;

  /// No description provided for @monthlySpendingLimit.
  ///
  /// In en, this message translates to:
  /// **'Monthly Spending Limit'**
  String get monthlySpendingLimit;

  /// No description provided for @yearlySpendingLimit.
  ///
  /// In en, this message translates to:
  /// **'Yearly Spending Limit'**
  String get yearlySpendingLimit;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @dataPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Data Privacy'**
  String get dataPrivacy;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @searchPayments.
  ///
  /// In en, this message translates to:
  /// **'Search \'Payments\''**
  String get searchPayments;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'Search Results'**
  String get searchResults;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @passwordUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password Updated Successfully'**
  String get passwordUpdatedSuccessfully;

  /// No description provided for @notificationSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get notificationSettings;

  /// No description provided for @receiveNotifications.
  ///
  /// In en, this message translates to:
  /// **'Receive Notifications'**
  String get receiveNotifications;

  /// No description provided for @transactionNotifications.
  ///
  /// In en, this message translates to:
  /// **'Transaction Notifications'**
  String get transactionNotifications;

  /// No description provided for @securitySettings.
  ///
  /// In en, this message translates to:
  /// **'Security Settings'**
  String get securitySettings;

  /// No description provided for @twoFactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get twoFactorAuthentication;

  /// No description provided for @enableTwoFactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Enable Two-Factor Authentication'**
  String get enableTwoFactorAuthentication;

  /// No description provided for @disableTwoFactorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Disable Two-Factor Authentication'**
  String get disableTwoFactorAuthentication;

  /// No description provided for @twoFactorAuthenticationMessage.
  ///
  /// In en, this message translates to:
  /// **'Add an extra layer of security to your account by enabling two-factor authentication.'**
  String get twoFactorAuthenticationMessage;

  /// No description provided for @twoFactorAuthenticationEnabled.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication Enabled'**
  String get twoFactorAuthenticationEnabled;

  /// No description provided for @twoFactorAuthenticationDisabled.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication Disabled'**
  String get twoFactorAuthenticationDisabled;

  /// No description provided for @privacySettings.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get privacySettings;

  /// No description provided for @publicProfile.
  ///
  /// In en, this message translates to:
  /// **'Public Profile'**
  String get publicProfile;

  /// No description provided for @showProfileInfo.
  ///
  /// In en, this message translates to:
  /// **'Show Profile Information'**
  String get showProfileInfo;

  /// No description provided for @hideProfileInfo.
  ///
  /// In en, this message translates to:
  /// **'Hide Profile Information'**
  String get hideProfileInfo;

  /// No description provided for @languageSettings.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @currencySettings.
  ///
  /// In en, this message translates to:
  /// **'Currency Settings'**
  String get currencySettings;

  /// No description provided for @selectCurrency.
  ///
  /// In en, this message translates to:
  /// **'Select Currency'**
  String get selectCurrency;

  /// No description provided for @darkModeSettings.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode Settings'**
  String get darkModeSettings;

  /// No description provided for @enableDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Enable Dark Mode'**
  String get enableDarkMode;

  /// No description provided for @disableDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Disable Dark Mode'**
  String get disableDarkMode;

  /// No description provided for @darkModeComfortableMessage.
  ///
  /// In en, this message translates to:
  /// **'Switch to a dark theme for a more comfortable viewing experience.'**
  String get darkModeComfortableMessage;

  /// No description provided for @darkModeEnabled.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode Enabled'**
  String get darkModeEnabled;

  /// No description provided for @darkModeDisabled.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode Disabled'**
  String get darkModeDisabled;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get faq;

  /// No description provided for @contactUsDescription.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions or need assistance, please contact our support team.'**
  String get contactUsDescription;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Coinpay is a secure and convenient mobile payment application that allows you to send and receive money instantly.'**
  String get aboutDescription;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutConfirmation;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @loggedOutSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get loggedOutSuccessfully;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistory;

  /// No description provided for @noTransactionsFound.
  ///
  /// In en, this message translates to:
  /// **'No transactions found'**
  String get noTransactionsFound;

  /// No description provided for @transactionDetails.
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get transactionDetails;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @sender.
  ///
  /// In en, this message translates to:
  /// **'Sender'**
  String get sender;

  /// No description provided for @recipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient'**
  String get recipient;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @letsAddYourCard.
  ///
  /// In en, this message translates to:
  /// **'Let\'s add your card'**
  String get letsAddYourCard;

  /// No description provided for @experienceThePower.
  ///
  /// In en, this message translates to:
  /// **'Experience the power of financial organization with our platform.'**
  String get experienceThePower;

  /// No description provided for @addYourCard.
  ///
  /// In en, this message translates to:
  /// **'Add your card'**
  String get addYourCard;

  /// No description provided for @addCard.
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get addCard;

  /// No description provided for @enterYourCreditCardInfo.
  ///
  /// In en, this message translates to:
  /// **'Enter your credit card info into the box below.'**
  String get enterYourCreditCardInfo;

  /// No description provided for @accountHolderName.
  ///
  /// In en, this message translates to:
  /// **'Account Holder Name'**
  String get accountHolderName;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get cardNumber;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verifyYourCode.
  ///
  /// In en, this message translates to:
  /// **'Verify your code'**
  String get verifyYourCode;

  /// No description provided for @weSend6DigitsCodeTo.
  ///
  /// In en, this message translates to:
  /// **'We send 6 digits code to'**
  String get weSend6DigitsCodeTo;

  /// No description provided for @didntGetACode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get a code? '**
  String get didntGetACode;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @error404.
  ///
  /// In en, this message translates to:
  /// **'Error 404'**
  String get error404;

  /// No description provided for @pageNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page Not Found'**
  String get pageNotFound;

  /// No description provided for @notFoundPageMessage.
  ///
  /// In en, this message translates to:
  /// **'Oops! It looks like the page you are looking for doesn\'t exist or has been moved. Please try again or go back to the home page.'**
  String get notFoundPageMessage;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @pleaseEnterYourName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterYourName;

  /// No description provided for @addYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Add your email'**
  String get addYourEmail;

  /// No description provided for @emailValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get emailValidationMessage;

  /// No description provided for @homeAddress.
  ///
  /// In en, this message translates to:
  /// **'Home address'**
  String get homeAddress;

  /// No description provided for @addressLine.
  ///
  /// In en, this message translates to:
  /// **'Address Line'**
  String get addressLine;

  /// No description provided for @addressLineValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid address line'**
  String get addressLineValidationMessage;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addressValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid address'**
  String get addressValidationMessage;

  /// No description provided for @userNameValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid user name'**
  String get userNameValidationMessage;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @cityValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid city'**
  String get cityValidationMessage;

  /// No description provided for @state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get state;

  /// No description provided for @stateValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid state'**
  String get stateValidationMessage;

  /// No description provided for @postcode.
  ///
  /// In en, this message translates to:
  /// **'Postcode'**
  String get postcode;

  /// No description provided for @posycodeExp.
  ///
  /// In en, this message translates to:
  /// **'Ex: 00000'**
  String get posycodeExp;

  /// No description provided for @postCodeValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Just Five Hundred PostCode'**
  String get postCodeValidationMessage;

  /// No description provided for @cardSuccessfullyAdded.
  ///
  /// In en, this message translates to:
  /// **'Your Card successfully added'**
  String get cardSuccessfullyAdded;

  /// No description provided for @cardList.
  ///
  /// In en, this message translates to:
  /// **'Card list'**
  String get cardList;

  /// No description provided for @enterCardInfo.
  ///
  /// In en, this message translates to:
  /// **'Enter your credit card info into the box below'**
  String get enterCardInfo;

  /// No description provided for @addAnotherCard.
  ///
  /// In en, this message translates to:
  /// **'Add Another Card'**
  String get addAnotherCard;

  /// No description provided for @addMoney.
  ///
  /// In en, this message translates to:
  /// **'Add Money'**
  String get addMoney;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @onboardFirstTitle.
  ///
  /// In en, this message translates to:
  /// **'Need a car? Find the most suitable car with Hanngar and rent it right away'**
  String get onboardFirstTitle;

  /// No description provided for @onboardSecondTitle.
  ///
  /// In en, this message translates to:
  /// **'Is your car idle? Easily rent out your car and earn extra income'**
  String get onboardSecondTitle;

  /// No description provided for @onboardThirdTitle.
  ///
  /// In en, this message translates to:
  /// **'Rent safely and easily with HannGar'**
  String get onboardThirdTitle;

  /// No description provided for @verifyYourNumber.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Number'**
  String get verifyYourNumber;

  /// No description provided for @confirmYourPhone.
  ///
  /// In en, this message translates to:
  /// **'Confirm Your Phone'**
  String get confirmYourPhone;

  /// No description provided for @coinpayText.
  ///
  /// In en, this message translates to:
  /// **'Coinpay is a powerful too! that allows you to easily send, receive, and track all your transactions.'**
  String get coinpayText;

  /// No description provided for @createYour.
  ///
  /// In en, this message translates to:
  /// **'Create your'**
  String get createYour;

  /// No description provided for @beforeWeSendCode.
  ///
  /// In en, this message translates to:
  /// **'Veriy your phone number before we send code'**
  String get beforeWeSendCode;

  /// No description provided for @uSDollar.
  ///
  /// In en, this message translates to:
  /// **'US Dollar'**
  String get uSDollar;

  /// No description provided for @tL.
  ///
  /// In en, this message translates to:
  /// **'Turkish Lira'**
  String get tL;

  /// No description provided for @selectamethodforsending.
  ///
  /// In en, this message translates to:
  /// **'Select a Method for Sending Money'**
  String get selectamethodforsending;

  /// No description provided for @support_view_title.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support_view_title;

  /// No description provided for @support_view_CoinPay_Support.
  ///
  /// In en, this message translates to:
  /// **'CoinPay Support'**
  String get support_view_CoinPay_Support;

  /// No description provided for @support_view_assist_you.
  ///
  /// In en, this message translates to:
  /// **'Our dedicated team is here to assist you'**
  String get support_view_assist_you;

  /// No description provided for @support_view_relted_to_our.
  ///
  /// In en, this message translates to:
  /// **'with any question  or issues relted to our'**
  String get support_view_relted_to_our;

  /// No description provided for @support_view_mobile_app.
  ///
  /// In en, this message translates to:
  /// **'CoinPay mobile app.'**
  String get support_view_mobile_app;

  /// No description provided for @support_view_start_button.
  ///
  /// In en, this message translates to:
  /// **'Start Chat'**
  String get support_view_start_button;

  /// No description provided for @support_view_view_faq.
  ///
  /// In en, this message translates to:
  /// **'View FAQ'**
  String get support_view_view_faq;

  /// No description provided for @chat_view_title.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get chat_view_title;

  /// No description provided for @chat_view_time.
  ///
  /// In en, this message translates to:
  /// **'Sunday at 4:20 PM'**
  String get chat_view_time;

  /// No description provided for @chat_view_Helper_Bot.
  ///
  /// In en, this message translates to:
  /// **'Coinpay Helper Bot'**
  String get chat_view_Helper_Bot;

  /// No description provided for @chat_view_Bot_message.
  ///
  /// In en, this message translates to:
  /// **'Welcome to CoinPay Support! How can we assist you today?'**
  String get chat_view_Bot_message;

  /// No description provided for @chat_view_Just_now.
  ///
  /// In en, this message translates to:
  /// **'Just Now'**
  String get chat_view_Just_now;

  /// No description provided for @chat_view_user_message.
  ///
  /// In en, this message translates to:
  /// **'I need halp regarding my coinpay account. I can\'t send money'**
  String get chat_view_user_message;

  /// No description provided for @chat_view_sent.
  ///
  /// In en, this message translates to:
  /// **'sent'**
  String get chat_view_sent;

  /// No description provided for @chat_view_typing.
  ///
  /// In en, this message translates to:
  /// **'Typing'**
  String get chat_view_typing;

  /// No description provided for @chat_view_type_message.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get chat_view_type_message;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @user_infoRow.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Profile Photo'**
  String get user_infoRow;

  /// No description provided for @user_infoRowCamera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get user_infoRowCamera;

  /// No description provided for @user_infoRowGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get user_infoRowGallery;

  /// No description provided for @languageTr.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get languageTr;

  /// No description provided for @languageDe.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get languageDe;

  /// No description provided for @languageAr.
  ///
  /// In en, this message translates to:
  /// **'عربي'**
  String get languageAr;

  /// No description provided for @languageSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected Language: \$selectedLanguage'**
  String get languageSelected;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'tr': return L10nTr();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
