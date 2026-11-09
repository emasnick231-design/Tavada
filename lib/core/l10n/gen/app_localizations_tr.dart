// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'Tavada Eats';

  @override
  String get appTagline => 'Her zaman Afrikalı, her yerde';

  @override
  String get commonContinue => 'Devam et';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonSaveChanges => 'Değişiklikleri kaydet';

  @override
  String get commonDone => 'Tamam';

  @override
  String get commonApply => 'Uygula';

  @override
  String get commonReset => 'Sıfırla';

  @override
  String get commonRetry => 'Tekrar dene';

  @override
  String get commonClose => 'Kapat';

  @override
  String get commonBack => 'Geri';

  @override
  String get commonNext => 'İleri';

  @override
  String get commonSeeAll => 'Tümünü gör';

  @override
  String get commonSearch => 'Ara';

  @override
  String get commonClearAll => 'Tümünü temizle';

  @override
  String get commonEdit => 'Düzenle';

  @override
  String get commonChange => 'Değiştir';

  @override
  String get commonDelete => 'Sil';

  @override
  String get commonRemove => 'Kaldır';

  @override
  String get commonConfirm => 'Onayla';

  @override
  String get commonYes => 'Evet';

  @override
  String get commonNo => 'Hayır';

  @override
  String get commonOk => 'Tamam';

  @override
  String get commonRequired => 'Zorunlu';

  @override
  String get commonOptional => 'İsteğe bağlı';

  @override
  String get commonFree => 'Ücretsiz';

  @override
  String get commonOr => 'veya';

  @override
  String get commonToday => 'Bugün';

  @override
  String get commonYesterday => 'Dün';

  @override
  String get commonJustNow => 'Az önce';

  @override
  String get commonReadMore => 'Devamını oku';

  @override
  String get commonShowLess => 'Daha az göster';

  @override
  String get commonMoreInfo => 'daha fazla bilgi';

  @override
  String get commonComingSoon => 'Çok yakında';

  @override
  String commonComingSoonMessage(String feature) {
    return '$feature çok yakında geliyor. Takipte kalın!';
  }

  @override
  String commonMinutes(int count) {
    return '$count dk';
  }

  @override
  String commonMinutesLong(int count) {
    return '$count dk';
  }

  @override
  String commonMiles(String distance) {
    return '$distance mil';
  }

  @override
  String commonResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sonuç',
      one: '1 sonuç',
      zero: 'Sonuç yok',
    );
    return '$_temp0';
  }

  @override
  String commonItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ürün',
      one: '1 ürün',
    );
    return '$_temp0';
  }

  @override
  String commonRelativeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ay önce',
      one: '1 ay önce',
    );
    return '$_temp0';
  }

  @override
  String commonRelativeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün önce',
      one: '1 gün önce',
    );
    return '$_temp0';
  }

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navStores => 'Mağazalar';

  @override
  String get navBasket => 'Sepet';

  @override
  String get navProfile => 'Profil';

  @override
  String get legalAgreePrefix => 'Devam ederek';

  @override
  String get legalPrivacyPolicy => 'Gizlilik Politikamızı';

  @override
  String get legalAnd => 've';

  @override
  String get legalTermsOfUse => 'Kullanım Koşullarımızı kabul etmiş olursunuz';

  @override
  String get errorTitle => 'Hay aksi!';

  @override
  String get errorNetwork =>
      'İnternet bağlantınız yok. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get errorTimeout =>
      'Bu işlem her zamankinden uzun sürüyor. Lütfen tekrar deneyin.';

  @override
  String get errorServer =>
      'Bizim tarafımızda bir sorun oluştu. Lütfen tekrar deneyin.';

  @override
  String get errorUnauthorized =>
      'Oturumunuzun süresi doldu. Lütfen tekrar giriş yapın.';

  @override
  String get errorNotFound => 'Aradığınızı bulamadık.';

  @override
  String get errorUnexpected =>
      'Beklenmeyen bir şey oldu. Lütfen tekrar deneyin.';

  @override
  String get offlineBanner =>
      'Çevrimdışısınız. Otomatik olarak yeniden bağlanacağız.';

  @override
  String get backOnlineBanner => 'Tekrar çevrimiçi';

  @override
  String get emptyGenericTitle => 'Henüz burada bir şey yok';

  @override
  String get emptyGenericMessage =>
      'Yakında tekrar bakın — yeni lezzetler pişiyor.';

  @override
  String get signInRequiredTitle => 'Devam etmek için giriş yapın';

  @override
  String get signInRequiredMessage =>
      'Sipariş vermek, teslimatları takip etmek ve ödüller kazanmak için hesap oluşturun veya giriş yapın.';

  @override
  String get signInRequiredAction => 'Giriş yap';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageTurkish => 'Türkçe';

  @override
  String get languageSystem => 'Sistem varsayılanı';

  @override
  String get ratingExcellent => 'Mükemmel';

  @override
  String get ratingVeryGood => 'Çok İyi';

  @override
  String get ratingGood => 'İyi';

  @override
  String get ratingFair => 'Orta';

  @override
  String get mapAttribution => '© OpenStreetMap © CARTO';

  @override
  String get errorGoHome => 'Ana sayfaya git';

  @override
  String get errorPageNotFound =>
      'Bu sayfa yok (artık). Seni yemeklere geri götürelim.';

  @override
  String get authEmailTitle => 'Hesabını oluştur';

  @override
  String get authEmailSubtitle =>
      'Adını ve hesabını doğrulamak için kullanacağımız e-postayı yaz';

  @override
  String get authEmailHint => 'E-posta adresini gir';

  @override
  String get authHaveAccount => 'Hesabın var mı?';

  @override
  String get authLogIn => 'Giriş yap';

  @override
  String get authPhoneTitle => 'Telefon numaran nedir?';

  @override
  String get authPhoneSubtitle =>
      'Bu numarayı bildirim almak, giriş yapmak ve hesabını kurtarmak için kullanacaksın';

  @override
  String get authPasswordTitle => 'Hesap şifreni belirle';

  @override
  String get authPasswordSubtitle =>
      'Şifren en az 8 karakter olmalı; bir harf ve bir rakam ya da özel karakter içermeli';

  @override
  String get authPasswordHint => 'Şifreni gir';

  @override
  String get authRuleLength => 'En az 8 karakter var';

  @override
  String get authRuleSpecial => 'Bir rakam veya özel karakter içeriyor';

  @override
  String get authRuleLetter => 'Bir harf içeriyor';

  @override
  String get authOtpTitleEmail =>
      'E-postana bir kod gönderdik, devam etmek için buraya gir';

  @override
  String get authOtpTitlePhone =>
      'Telefonuna bir kod gönderdik, devam etmek için buraya gir';

  @override
  String authOtpSentTo(String destination) {
    return '$destination adresine gönderildi';
  }

  @override
  String get authChangeEmail => 'E-postanı değiştir?';

  @override
  String get authChangePhone => 'Numaranı değiştir?';

  @override
  String authResendIn(String time) {
    return '$time sonra kodu tekrar gönder';
  }

  @override
  String get authResendCode => 'Kodu tekrar gönder';

  @override
  String get authCodeResent => 'Yeni kod yolda';

  @override
  String get authOtpDevTip => 'Geliştirici ipucu: 1234 kullan';

  @override
  String get authWelcomeBackTitle => 'Tekrar hoş geldin!';

  @override
  String get authWelcomeBackSubtitle => 'Devam etmek için bilgilerini gir';

  @override
  String get authUsePhone => 'Telefon numarası kullan?';

  @override
  String get authUseEmail => 'Bunun yerine e-posta kullan?';

  @override
  String get authForgotPasswordLink => 'Şifreni mi unuttun?';

  @override
  String get authNoAccount => 'Hesabın yok mu?';

  @override
  String get authSignUp => 'Kaydol';

  @override
  String get authLoginDemoTip => 'Demo: emasv58@yahoo.com · Password1!';

  @override
  String get authForgotTitle => 'Şifreni mi unuttun?';

  @override
  String get authForgotSubtitle => 'E-postana bir doğrulama kodu göndereceğiz';

  @override
  String get authResetTitle => 'Şifreni sıfırla';

  @override
  String get authResetSubtitle =>
      'Gereken değişiklikleri yap, eski bir şifre kullanma';

  @override
  String get authConfirmPasswordHint => 'Şifreyi onayla';

  @override
  String get authPasswordsMismatch => 'Şifreler eşleşmiyor';

  @override
  String get authCompleteChanges => 'Değişiklikleri tamamla';

  @override
  String get authPasswordUpdated =>
      'Şifre güncellendi. Yeni şifrenle giriş yap.';

  @override
  String authWelcomeToast(String name) {
    return 'Hoş geldin, $name!';
  }

  @override
  String get authErrorInvalidCredentials => 'E-posta veya şifre hatalı';

  @override
  String get authErrorPhoneNotFound =>
      'Bu numaraya ait bir hesap bulamadık. Kaydolmak ister misin?';

  @override
  String get authErrorInvalidCode => 'Kod hatalı. Kontrol edip tekrar dene.';

  @override
  String get authErrorEmailTaken =>
      'Bu e-postayla bir hesap zaten var. Giriş yapmak ister misin?';

  @override
  String get authErrorInvalidEmail => 'Geçerli bir e-posta adresi gir';

  @override
  String get authSelectCountry => 'Ülke seç';

  @override
  String get authSearchCountry => 'Ülke ara';

  @override
  String get authFlowExpired => 'Bu adımın süresi doldu. Lütfen baştan başla.';

  @override
  String get authFirstNameHint => 'Ad';

  @override
  String get authLastNameHint => 'Soyad';

  @override
  String get basketTitle => 'Sepet';

  @override
  String get basketClearOrders => 'Siparişleri temizle';

  @override
  String get basketTabBaskets => 'Sepetlerim';

  @override
  String get basketTabOngoing => 'Devam eden';

  @override
  String get basketTabCompleted => 'Tamamlanan';

  @override
  String basketItemsTotal(String items, String total) {
    return '$items · $total';
  }

  @override
  String get basketDeliverTo => 'Adres: ';

  @override
  String get basketVisitStore => 'Mağazaya git';

  @override
  String get basketCheckout => 'Ödeme';

  @override
  String get basketClearAllTitle => 'Tüm sepetler temizlensin mi?';

  @override
  String get basketClearAllMessage =>
      'Sepetlerindeki tüm ürünler kaldırılacak.';

  @override
  String get basketClearAllConfirm => 'Hepsini temizle';

  @override
  String get basketEmptyTitle => 'Sepetin boş';

  @override
  String get basketEmptyMessage =>
      'Restoranlardan eklediğin yemekler burada görünür.';

  @override
  String get basketBrowse => 'Lezzetli bir şey bul';

  @override
  String get basketNoOngoingTitle => 'Yolda sipariş yok';

  @override
  String get basketNoOngoingMessage =>
      'Sipariş verdiğinde buradan takip edebilirsin.';

  @override
  String get basketNoCompletedTitle => 'Henüz geçmiş sipariş yok';

  @override
  String get basketNoCompletedMessage =>
      'Teslim aldığın siparişler burada listelenir.';

  @override
  String basketOrderNumber(String number) {
    return 'Sipariş $number';
  }

  @override
  String get basketTrackOrder => 'Siparişi takip et';

  @override
  String get basketReorder => 'Tekrar sipariş ver';

  @override
  String get basketViewDetails => 'Detayları gör';

  @override
  String get basketSignInMessage =>
      'Devam eden ve geçmiş siparişlerini görmek için giriş yap.';

  @override
  String get basketViewTimeline => 'Zaman çizelgesi';

  @override
  String basketOrderEta(String status, String time) {
    return '$status · tahmini varış $time';
  }

  @override
  String basketRemoved(String store) {
    return '$store sepeti kaldırıldı';
  }

  @override
  String get basketUndo => 'Geri al';

  @override
  String get cartAdded => 'Sepetine eklendi';

  @override
  String get cartViewBasket => 'Sepeti gör';

  @override
  String get checkoutTitle => 'Ödeme';

  @override
  String get checkoutHideSelections => 'Seçimleri gizle';

  @override
  String get checkoutShowSelections => 'Seçimleri göster';

  @override
  String checkoutPack(int number) {
    return 'Paket $number';
  }

  @override
  String get checkoutYourSelections => 'Seçimlerin';

  @override
  String get checkoutEditSelection => 'Seçimi düzenle';

  @override
  String get checkoutAddAnotherItem => 'Başka ürün ekle';

  @override
  String get checkoutDeliveryInfo => 'Teslimat Bilgisi';

  @override
  String get checkoutDelivery => 'Teslimat';

  @override
  String get checkoutPickup => 'Gel-al';

  @override
  String checkoutMiles(String distance) {
    return '$distance mil';
  }

  @override
  String get checkoutChooseAddress => 'Bir teslimat adresi seç';

  @override
  String get checkoutDeliveryInstructions => 'Teslimat talimatları';

  @override
  String get checkoutDeliveryInstructionsHint => 'Kuryeye özel bilgi ekle';

  @override
  String get checkoutAllergyInfo => 'Alerji & Diyet Bilgisi';

  @override
  String get checkoutAllergyInformation => 'Alerji Bilgisi';

  @override
  String get checkoutDietaryLabels => 'Diyet Etiketleri';

  @override
  String checkoutDeliversIn(int minutes) {
    return '$minutes dk içinde teslim';
  }

  @override
  String get checkoutStoreLocation => 'Mağaza konumu';

  @override
  String get checkoutDistance => 'Mesafe';

  @override
  String get checkoutPickupTime => 'Teslim alma süresi';

  @override
  String checkoutPickupWindow(int from, int to) {
    return '$from - $to dk';
  }

  @override
  String get checkoutPaymentOption => 'Ödeme seçeneğini seç';

  @override
  String get checkoutPayWithWallet => 'Cüzdanla öde';

  @override
  String checkoutWalletBalance(String balance) {
    return 'Bakiye: $balance';
  }

  @override
  String get checkoutPayWithCard => 'Kredi veya banka kartı kullan';

  @override
  String get checkoutWalletTooLow => 'Bu sipariş için bakiye yetersiz';

  @override
  String get checkoutCutlery => 'Çatal-bıçak veya pipet iste';

  @override
  String get checkoutSendAsGift => 'Hediye olarak gönder';

  @override
  String checkoutGiftFor(String name) {
    return '$name için hediye';
  }

  @override
  String get checkoutGiftSaved => 'Hediye bilgileri kaydedildi';

  @override
  String get checkoutPaymentSummary => 'Ödeme özeti';

  @override
  String get checkoutSubtotal => 'Ara toplam';

  @override
  String get checkoutDeliveryFee => 'Teslimat ücreti';

  @override
  String get checkoutServiceFee => 'Hizmet bedeli';

  @override
  String get checkoutDiscount => 'Uygulanan indirim';

  @override
  String get checkoutTotal => 'Toplam';

  @override
  String get checkoutMakePayment => 'Ödeme yap';

  @override
  String get checkoutClearTitle => 'Bu sepet temizlensin mi?';

  @override
  String checkoutClearMessage(String store) {
    return '$store sepetindeki tüm ürünler kaldırılacak.';
  }

  @override
  String get checkoutClearConfirm => 'Sepeti temizle';

  @override
  String get checkoutRemovePackTitle => 'Bu paket kaldırılsın mı?';

  @override
  String checkoutRemovePackMessage(String name) {
    return '$name sepetinden kaldırılacak.';
  }

  @override
  String get checkoutInstructionsHint => 'Bir mesaj bırak...';

  @override
  String get checkoutAddNote => 'Not ekle';

  @override
  String get checkoutGiftTitle => 'Hediyeni kişiselleştir';

  @override
  String get checkoutGiftSender => 'Bu hediyeyi kim gönderiyor?';

  @override
  String get checkoutGiftRecipient => 'Bu hediye kimin için?';

  @override
  String get checkoutGiftRecipientHint => 'Adını veya takma adını gir';

  @override
  String get checkoutGiftPhone => 'Alıcının telefon numarası';

  @override
  String get checkoutGiftFindContacts => 'Kişilerden bul';

  @override
  String get checkoutGiftNote => 'Bir not ekle';

  @override
  String get checkoutGiftSave => 'Hediyeyi kaydet';

  @override
  String get checkoutGiftRemove => 'Hediyeyi kaldır';

  @override
  String get checkoutContactsTitle => 'Bir kişi seç';

  @override
  String get checkoutEmptyTitle => 'Sepetin boş';

  @override
  String get checkoutEmptyMessage => 'Ödeme yapmak için birkaç yemek ekle.';

  @override
  String get checkoutBackToStore => 'Mağazaya dön';

  @override
  String get checkoutUseCard => 'Kart kullan';

  @override
  String checkoutClosedBanner(String store, String time) {
    return '$store şu anda kapalı. $time itibarıyla açılıyor.';
  }

  @override
  String get checkoutCountryPicker => 'Ülke seç';

  @override
  String get checkoutCountrySearch => 'Ülke ara';

  @override
  String get checkoutQuoteFailed =>
      'Toplamınızı güncelleyemedik. Ödemeden önce tekrar deneyin.';

  @override
  String get checkoutTopUp => 'Bakiye yükle';

  @override
  String get checkoutWalletBlocked =>
      'Devam etmek için cüzdanınıza bakiye yükleyin veya kartla ödeyin.';

  @override
  String checkoutClosedShort(String store, String time) {
    return '$store kapalı · $time itibarıyla açık';
  }

  @override
  String get homeNow => 'Şimdi';

  @override
  String get homeAddAddress => 'Teslimat adresi ekle';

  @override
  String get homeFilter => 'Filtre';

  @override
  String get homeSearchHint => 'Afrika yemekleri ve restoranları ara';

  @override
  String get homeFilterDiscounts => 'İndirimler';

  @override
  String get homeFilterCuisines => 'Mutfaklar';

  @override
  String get homeFilterTopRated => 'En iyi puanlı';

  @override
  String get homeFilterUnder30 => '30 dk altı';

  @override
  String get homeFilterDietary => 'Diyet';

  @override
  String get homeFilterDeliveryFee => 'Teslimat ücreti';

  @override
  String get homeFilterOffers => 'Fırsatlar';

  @override
  String get homeCuisinesTitle => 'Favori mutfaklarını seç';

  @override
  String get homeDietaryTitle => 'Diyet';

  @override
  String get homeDeliveryFeeTitle => 'Teslimat ücreti';

  @override
  String get homeChangeLocationTitle => 'Konumu değiştir..';

  @override
  String get homeSearchElsewhere => 'Başka bir yer ara';

  @override
  String get homeUseCurrentLocation => 'Mevcut konumumu kullan';

  @override
  String get homeNoResultsTitle => 'Filtrelerine uyan mekan yok';

  @override
  String get homeNoResultsMessage => 'Bir iki filtreyi kaldırmayı dene';

  @override
  String get homeListEmptyTitle => 'Henüz bir şey yok';

  @override
  String get homeListEmptyMessage =>
      'Her hafta Tavada\'ya yeni mekanlar katılıyor.';

  @override
  String get homeNoStoresTitle => 'Henüz bölgende değiliz';

  @override
  String get homeNoStoresMessage =>
      'Bu adrese henüz teslimat yapan mağaza yok. Başka bir adres dene.';

  @override
  String get homeChangeAddress => 'Adresi değiştir';

  @override
  String get locationIntroShout => 'Howfa naw!';

  @override
  String get locationIntroTitle => 'Nerede kalıyorsun?';

  @override
  String get locationIntroBody =>
      'Konumunu bilmemize yardım et, böylece sipariş verebileceğin yakındaki mekanları gösterebilelim';

  @override
  String get locationFindMe => 'Beni bul';

  @override
  String get locationSearchInstead => 'Bunun yerine adres ara';

  @override
  String get locationPickerTitle => 'Konum seç';

  @override
  String get locationSearchHint => 'Burada ara veya haritayı kaydır';

  @override
  String get locationDragHint => 'Haritayı tercih ettiğin konuma sürükle';

  @override
  String get locationConfirmCurrent => 'Mevcut konumunu onayla';

  @override
  String get locationSelect => 'Bu konumu seç';

  @override
  String get locationResolving => 'Adres bulunuyor…';

  @override
  String get locationDroppedPin => 'İşaretlenen konum';

  @override
  String get locationRecenter => 'Ortala';

  @override
  String get locationNoResultsTitle => 'Yer bulunamadı';

  @override
  String get locationNoResultsMessage =>
      'Bir sokak, bölge veya posta kodu dene';

  @override
  String get locationSearchEmptyTitle => 'Nereye teslim edelim?';

  @override
  String get locationSearchEmptyMessage =>
      'Bir sokak, bölge veya posta kodu ara';

  @override
  String get locationUseCurrent => 'Mevcut konumumu kullan';

  @override
  String get locationServiceDisabledTitle => 'Konum kapalı';

  @override
  String get locationServiceDisabledMessage =>
      'Yakınındaki restoranları bulmak için konum servislerini aç veya adresini haritada seç.';

  @override
  String get locationDeniedForeverTitle => 'Konum erişimi kapalı';

  @override
  String get locationDeniedForeverMessage =>
      'Ayarlar\'dan Tavada Eats için konum erişimine izin ver veya adresini haritada seç.';

  @override
  String get locationOpenSettings => 'Ayarları aç';

  @override
  String get locationChooseOnMap => 'Haritada seç';

  @override
  String get locationFallbackToast =>
      'Konumunu alamadık, bu yüzden seni Londra\'dan başlattık.';

  @override
  String locationDeliveringTo(String address) {
    return 'Teslimat adresi: $address';
  }

  @override
  String get locationPinnedTitle => 'İşaretlenen konum';

  @override
  String get locationResolveFailed =>
      'Bu adresi bulamadık. İğneyi yine de kullanabilirsin.';

  @override
  String get onboardingContinueAsGuest => 'Misafir olarak devam et';

  @override
  String get onboardingHeadlineTop => 'HER ZAMAN AFRİKA';

  @override
  String get onboardingHeadlineBottom => 'HER YERDE';

  @override
  String get onboardingGetStarted => 'Başlayalım';

  @override
  String get onboardingLogIn => 'Hesabına giriş yap';

  @override
  String get onboardingContinueWithApple => 'Apple ile devam et';

  @override
  String get onboardingContinueWithGoogle => 'Google ile devam et';

  @override
  String get onboardingContinueWithEmail => 'E-posta ile devam et';

  @override
  String get onboardingAppleSignIn => 'Apple ile giriş';

  @override
  String get onboardingGoogleSignIn => 'Google ile giriş';

  @override
  String get ordersHangTight => 'Biraz sabret, hazırlıyoruz';

  @override
  String get ordersEstimatedArrival => 'Tahmini varış';

  @override
  String get ordersStatusPlaced => 'Sipariş alındı';

  @override
  String get ordersStatusPreparing => 'Hazırlanıyor';

  @override
  String get ordersStatusRiderPicked => 'Kurye siparişi alıyor';

  @override
  String get ordersStatusDispatched => 'Yolda';

  @override
  String get ordersStatusDelivered => 'Teslim edildi';

  @override
  String get ordersStatusCancelled => 'İptal edildi';

  @override
  String get ordersCallRider => 'Kuryeyi ara';

  @override
  String get ordersDeliveryInfo => 'Teslimat bilgisi';

  @override
  String get ordersAddress => 'Adres';

  @override
  String get ordersPickupFrom => 'Teslim alma yeri';

  @override
  String get ordersInstruction => 'Teslimat notu';

  @override
  String get ordersNoInstruction => 'Kurye için not yok';

  @override
  String get ordersChange => 'Değiştir';

  @override
  String get ordersEdit => 'Düzenle';

  @override
  String get ordersChangeAfterPlacing =>
      'Bu sipariş yola çıktı. Teslimat bilgilerini değiştirmek için bize yaz.';

  @override
  String get ordersChat => 'Sohbet';

  @override
  String get ordersSummary => 'Sipariş özeti';

  @override
  String get ordersPaymentDetails => 'Ödeme detayları';

  @override
  String get ordersPaymentSummary => 'Ödeme özeti';

  @override
  String ordersArrivedIn(int minutes) {
    return 'Yaşasın! Yemeğin sadece $minutes dakikada geldi';
  }

  @override
  String get ordersRateBy => 'Teslimatı değerlendir: ';

  @override
  String get ordersThanksRating => 'Değerlendirmen için teşekkürler!';

  @override
  String get ordersRepeat => 'Siparişi tekrarla';

  @override
  String get ordersRepeated => 'Sepetine eklendi';

  @override
  String get ordersTimeOfDelivery => 'Teslimat saati';

  @override
  String get ordersEstimatedDelivery => 'Tahmini teslimat';

  @override
  String ordersMilestoneConfirmed(String store) {
    return '$store siparişini onayladı';
  }

  @override
  String get ordersMilestoneRiderAssigned => 'Siparişine bir kurye atandı';

  @override
  String get ordersMilestoneReady => 'Siparişin kuryenin alması için hazır';

  @override
  String get ordersMilestonePickedUp => 'Kurye siparişini aldı';

  @override
  String get ordersMilestoneArrived => 'Kurye adresine ulaştı';

  @override
  String get ordersViewTimeline => 'Zaman çizelgesi';

  @override
  String ordersGiftFor(String name) {
    return '$name için hediye';
  }

  @override
  String ordersRepeatTitle(String store) {
    return 'Zaten bir $store sepetin var';
  }

  @override
  String get ordersRepeatMessage =>
      'Bu siparişle değiştirelim mi, yoksa ürünleri sepete mi ekleyelim?';

  @override
  String get ordersRepeatReplace => 'Sepeti değiştir';

  @override
  String get ordersRepeatAdd => 'Sepete ekle';

  @override
  String ordersRepeatUnavailable(int count) {
    return '$count ürün artık mevcut değil, eklenmedi';
  }

  @override
  String get ordersNeedHelp => 'Bu siparişle ilgili yardım mı lazım?';

  @override
  String get profileGuest => 'Merhaba!';

  @override
  String get profileGuestMessage =>
      'Cüzdanını, ödüllerini ve siparişlerini görmek için giriş yap.';

  @override
  String get profileSignIn => 'Giriş yap veya hesap oluştur';

  @override
  String get profileWalletBalance => 'Cüzdan bakiyesi';

  @override
  String get profileAddMoney => 'Bakiye yükle';

  @override
  String get profileSeeActivity => 'Hareketler';

  @override
  String get profileUpdatePhone => 'Telefon numarasını güncelle';

  @override
  String get profileChangePassword => 'Şifreyi değiştir';

  @override
  String get profileNotifications => 'Bildirim tercihleri';

  @override
  String get profileRewards => 'Ödüller';

  @override
  String get profileAccessibility => 'Erişilebilirlik';

  @override
  String get profileHelp => 'Yardım al';

  @override
  String get profileLanguage => 'Dil';

  @override
  String get profileHaptics => 'Dokunsal geri bildirim';

  @override
  String get profileLogout => 'Çıkış yap';

  @override
  String get profileLogoutTitle => 'Çıkış yapılsın mı?';

  @override
  String get profileLogoutMessage =>
      'İstediğin zaman tekrar giriş yapabilirsin. Sepetlerin bu cihazda kalır.';

  @override
  String profilePointsToNext(String points) {
    return '$points puan';
  }

  @override
  String get profilePointsToNextSuffix => ' sonraki ödüle kaldı';

  @override
  String profileEarnReward(String value, String points) {
    return '$points puana ulaşınca $value kazan';
  }

  @override
  String get profileRedeemPoints => 'Puanları kullan';

  @override
  String profileReferFriend(String points) {
    return 'Arkadaşını davet et,\n$points puan kazan';
  }

  @override
  String profileRedeemed(String value) {
    return '$value cüzdanına eklendi!';
  }

  @override
  String profileVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get updatePhoneTitle => 'Telefon numaranı güncelle';

  @override
  String get updatePhoneSubtitle =>
      'Bu numarayı bildirimler, giriş ve hesap kurtarma için kullanacaksın';

  @override
  String get updatePhoneSaved => 'Telefon numarası güncellendi';

  @override
  String get changePasswordTitle => 'Şifreni değiştir';

  @override
  String get changePasswordSubtitle =>
      'Mevcut şifreni gir, ardından yenisini seç';

  @override
  String get changePasswordSaved => 'Şifre değiştirildi';

  @override
  String get notificationsTitle => 'Bildirim tercihleri';

  @override
  String get notificationsSubtitle =>
      'Özel teklifler, promosyonlar ve daha fazlası için nasıl bilgilendirilmek istediğini seç';

  @override
  String get notificationsPush => 'Anlık bildirimler';

  @override
  String get notificationsWhatsapp => 'WhatsApp';

  @override
  String get notificationsEmail => 'E-posta';

  @override
  String get notificationsOn => 'Açık';

  @override
  String get notificationsOff => 'Kapalı';

  @override
  String get notificationsCategoriesTitle => 'Kategoriler';

  @override
  String get notificationsOrderStatus => 'Sipariş durumu';

  @override
  String get notificationsOrderStatusBody =>
      'Bildirim gönderilmesine ve canlı sipariş takibine izin ver';

  @override
  String get notificationsPromotions => 'Promosyon bildirimleri';

  @override
  String get notificationsPromotionsBody =>
      'Özel teklifler ve kampanyalardan haberdar et';

  @override
  String get notificationsRecommendations => 'Öneriler';

  @override
  String get notificationsRecommendationsBody =>
      'Harika yemek ve market önerilerinden haberdar et';

  @override
  String get notificationsReminders => 'Hatırlatmalar';

  @override
  String get notificationsRemindersBody => 'Tamamlanmamış siparişleri hatırlat';

  @override
  String get notificationsSaved => 'Tercihler kaydedildi';

  @override
  String get accessibilityTitle => 'Erişilebilirlik';

  @override
  String get accessibilitySubtitle =>
      'Kuryelerin ve mağazaların sana daha iyi hizmet vermesine yardım et';

  @override
  String get accessibilityHearing => 'İşitme';

  @override
  String get accessibilityHearingBody =>
      'Kuryelere işitme engelin veya işitme güçlüğün olup olmadığını bildirmeyi seç';

  @override
  String get accessibilityHearingNone => 'İşitme engelim yok';

  @override
  String get accessibilityHearingDeaf => 'İşitme engelliyim';

  @override
  String get accessibilityHearingHard => 'İşitme güçlüğüm var';

  @override
  String get accessibilitySaved => 'Erişilebilirlik ayarları kaydedildi';

  @override
  String get addMoneyTitle => 'Para ekle';

  @override
  String addMoneyBalance(String balance) {
    return 'Bakiye: $balance';
  }

  @override
  String get addMoneySecurely => 'Güvenle para ekle';

  @override
  String addMoneySuccess(String amount) {
    return '$amount cüzdanına eklendi';
  }

  @override
  String get walletActivityTitle => 'Cüzdan hareketleri';

  @override
  String get walletEmptyTitle => 'Henüz hareket yok';

  @override
  String get walletEmptyMessage =>
      'Yüklemeler, ödemeler ve iadeler burada görünür.';

  @override
  String get walletTopUp => 'Cüzdan yükleme';

  @override
  String get walletPayment => 'Sipariş ödemesi';

  @override
  String get walletRefund => 'İade';

  @override
  String get walletReward => 'Ödül';

  @override
  String get rewardsTitle => 'Ödüller';

  @override
  String rewardsPoints(String points) {
    return '$points puan';
  }

  @override
  String get rewardsYourPoints => 'Puanların';

  @override
  String get rewardsHowItWorks => 'Nasıl çalışır';

  @override
  String get rewardsHow1 => 'Harcadığın her £1 için 10 puan kazan.';

  @override
  String rewardsHow2(String points, String value) {
    return '$points puanı $value cüzdan kredisine çevir.';
  }

  @override
  String rewardsHow3(String points) {
    return 'Kodunla arkadaşlarını davet et — ikiniz de $points puan kazanın.';
  }

  @override
  String get rewardsReferralCode => 'Davet kodun';

  @override
  String get rewardsShare => 'Kodu paylaş';

  @override
  String rewardsShareText(String code) {
    return 'Tavada Eats\'e $code kodumla katıl, ikimiz de bonus puan kazanalım!';
  }

  @override
  String get rewardsCopied => 'Kod kopyalandı';

  @override
  String get languageTitle => 'Dil';

  @override
  String get languageSubtitle => 'Uygulamanın dilini seç';

  @override
  String get changePasswordCurrentHint => 'Mevcut şifre';

  @override
  String get changePasswordNewHint => 'Yeni şifre';

  @override
  String get updatePhoneCodeTitle => 'Gönderdiğimiz kodu gir';

  @override
  String updatePhoneCodeSubtitle(String phone) {
    return 'Numaranın sana ait olduğunu doğrulamak için $phone numarasına 4 haneli bir kod gönderdik';
  }

  @override
  String get updatePhoneVerify => 'Doğrula ve kaydet';

  @override
  String get profileEditName => 'Adını düzenle';

  @override
  String get profileEditNameSubtitle =>
      'Restoranlar ve kuryeler seni bu isimle görecek';

  @override
  String get profileNameSaved => 'Adın güncellendi';

  @override
  String get profileEditProfile => 'Adı düzenle';

  @override
  String get profileDeleteAccount => 'Hesabı sil';

  @override
  String get profileDeleteTitle => 'Hesabın silinsin mi?';

  @override
  String get profileDeleteMessage =>
      'Bu işlem hesabını, sipariş geçmişini, cüzdan bakiyeni ve ödül puanlarını kalıcı olarak siler. Geri alınamaz.';

  @override
  String get profileDeleteConfirm => 'Hesabımı sil';

  @override
  String get profileDeleted => 'Hesabın silindi';

  @override
  String addMoneyMinimum(String amount, String card) {
    return 'En az yükleme $amount · $card kartından çekilir';
  }

  @override
  String get rewardsPointsSuffix => ' puan';

  @override
  String restaurantComments(int count) {
    return '$count yorum';
  }

  @override
  String get restaurantDeliveryTime => 'Teslimat süresi';

  @override
  String get restaurantCuisine => 'Mutfak';

  @override
  String get restaurantDeliveryFee => 'Teslimat ücreti';

  @override
  String get restaurantAiSummary => 'Yapay zeka özeti';

  @override
  String get restaurantAiDisclaimer =>
      'Bu özet müşteri yorumlarından otomatik olarak oluşturulur. Bilgilerin doğruluğunu, güncelliğini veya eksiksizliğini garanti etmiyoruz.';

  @override
  String get restaurantPopularOrders => 'Popüler siparişler';

  @override
  String get restaurantMenu => 'Menü';

  @override
  String get restaurantSearchMenu => 'Menüde ara';

  @override
  String get restaurantSearchMenuHint => 'Yemek ve içecek ara';

  @override
  String get restaurantSearchMenuMessage =>
      'Favori yemeğini veya içeceğini burada bul';

  @override
  String get restaurantNoDishesTitle => 'Yemek bulunamadı';

  @override
  String get restaurantNoDishesMessage => 'Farklı bir ad veya malzeme dene';

  @override
  String restaurantOpenUntil(String time) {
    return 'Şu an açık · $time saatine kadar';
  }

  @override
  String restaurantClosedOpensAt(String time) {
    return 'Kapalı · $time açılır';
  }

  @override
  String restaurantRatingReviews(String rating, int count) {
    return '$rating ($count yorum)';
  }

  @override
  String get restaurantAllergyInfo => 'Alerji ve diyet bilgisi';

  @override
  String get restaurantAllergyInformation => 'Alerji bilgisi';

  @override
  String get restaurantDietaryLabels => 'Diyet etiketleri';

  @override
  String restaurantOrdersCount(String count) {
    return '$count sipariş';
  }

  @override
  String get restaurantOrdersPeriod => 'son 12 ayda';

  @override
  String get restaurantAddressCopied => 'Adres kopyalandı';

  @override
  String restaurantMilesAway(String distance) {
    return '$distance mil';
  }

  @override
  String restaurantShareText(String name) {
    return '$name restoranından Tavada Eats ile sipariş ver';
  }

  @override
  String get restaurantClosedBanner =>
      'Şu an kapalı. Menüye yine de göz atabilirsin.';

  @override
  String get reviewsTitle => 'Yorumlar';

  @override
  String reviewsCount(int count) {
    return '$count+ yorum';
  }

  @override
  String get reviewsComments => 'Yorumlar';

  @override
  String get reviewsRestaurantReply => 'Restoranın yanıtı';

  @override
  String get reviewsThanksFeedback => 'Geri bildirimin için teşekkürler';

  @override
  String get reviewsEmptyTitle => 'Henüz yorum yok';

  @override
  String get reviewsEmptyMessage => 'İlk sipariş veren ve yorum yapan sen ol.';

  @override
  String get dishRequired => 'Zorunlu';

  @override
  String get dishOptional => 'İsteğe bağlı';

  @override
  String dishChooseUpTo(int count) {
    return 'En fazla $count seç';
  }

  @override
  String dishAddFor(String price) {
    return '$price ekle';
  }

  @override
  String dishUpdateFor(String price) {
    return 'Siparişi güncelle · $price';
  }

  @override
  String dishPercentOff(int percent) {
    return '%$percent indirim';
  }

  @override
  String get dishAllergenNotice =>
      'Yiyecekler alerjen içerebilir. Belirli alerjenler hakkında sorunuz mu var? ';

  @override
  String get dishContactRestaurant => 'Lütfen restoranla iletişime geçin';

  @override
  String get dishNoteHint => 'Mutfak için not ekle (isteğe bağlı)';

  @override
  String dishDeliveryMeta(String fee, String eta) {
    return '$fee teslimat ücreti · $eta';
  }

  @override
  String dishFreeDeliveryMeta(String eta) {
    return 'Ücretsiz teslimat · $eta';
  }

  @override
  String dishChooseRequired(String group) {
    return '“$group” için bir seçim yapın';
  }

  @override
  String dishMaxReached(int count) {
    return 'En fazla $count seçebilirsiniz';
  }

  @override
  String restaurantClosedBannerAt(String time) {
    return 'Şu anda kapalı · $time itibarıyla açılıyor. Menüye yine de göz atabilirsiniz.';
  }

  @override
  String get dishNoteTitle => 'Özel istekler';

  @override
  String get searchHint => 'Afrika yemekleri ve restoranları ara';

  @override
  String get searchRecent => 'Son aramalar';

  @override
  String get searchCategories => 'Kategoriler';

  @override
  String get searchTrendyCuisines => 'Yakınındaki trend mutfaklar';

  @override
  String searchFor(String query) {
    return '“$query” için ara';
  }

  @override
  String get searchAllAfrica => 'Tüm Afrika';

  @override
  String searchDeliveryFee(String fee) {
    return '$fee teslimat ücreti';
  }

  @override
  String get searchFreeDelivery => 'Ücretsiz teslimat';

  @override
  String searchNoResultsTitle(String query) {
    return '“$query” için sonuç yok';
  }

  @override
  String get searchNoResultsMessage =>
      'Yazımı kontrol et ya da farklı bir yemek, içecek veya restoran dene.';

  @override
  String get helpTitle => 'Nasıl yardımcı olabiliriz?';

  @override
  String get helpSubtitle => 'Ekibimiz 7/24 yardıma hazır';

  @override
  String get helpChatWithPerson => 'Bir temsilciyle konuş';

  @override
  String get helpWasHelpful => 'Bu yardımcı oldu mu?';

  @override
  String get helpYes => 'Evet';

  @override
  String get helpNo => 'Hayır';

  @override
  String get helpThanks => 'Bildirdiğin için teşekkürler!';

  @override
  String get chatTitle => 'Destekle sohbet';

  @override
  String chatWithAgent(String name) {
    return '$name ile sohbet';
  }

  @override
  String get chatEmpty =>
      'Sorununu bizimle paylaş, yardım etmek ve her şeyi düzeltmek için buradayız!';

  @override
  String get chatHint => 'Sorununu paylaş';

  @override
  String get chatSendFailed =>
      'Mesaj gönderilemedi. Tekrar denemek için dokun.';

  @override
  String get chatAttachPhoto => 'Fotoğraf ekle';

  @override
  String chatTyping(String name) {
    return '$name yazıyor';
  }

  @override
  String get chatPhotoAccessDenied =>
      'Fotoğraflarını açamıyoruz. Fotoğraf göndermek için Ayarlar’dan erişim izni ver.';
}
