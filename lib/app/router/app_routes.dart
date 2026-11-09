/// Every location in the app.
///
/// * `static const` values are used both as GoRoute paths and for
///   `context.go/push`.
/// * Builder methods (`restaurant(id)`) produce concrete locations; the
///   matching `…Path` constant is the GoRoute pattern.
///
/// Feature route files (`lib/features/<feature>/<feature>_routes.dart`)
/// declare the GoRoutes for these paths.
abstract final class AppRoutes {
  // ── Launch & onboarding ───────────────────────────────────────────────────
  static const splash = '/splash';
  static const welcome = '/welcome';

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const signUpEmail = '/auth/sign-up/email';
  static const signUpPhone = '/auth/sign-up/phone';
  static const signUpPassword = '/auth/sign-up/password';
  static const verifyOtp = '/auth/verify';
  static const login = '/auth/login';
  static const forgotPassword = '/auth/forgot-password';
  static const resetPassword = '/auth/reset-password';

  // ── Location ──────────────────────────────────────────────────────────────
  static const locationIntro = '/location';
  static const locationPicker = '/location/picker';
  static const locationSearch = '/location/search';

  // ── Bottom navigation tabs ────────────────────────────────────────────────
  static const home = '/home';
  static const stores = '/stores';
  static const basket = '/basket';
  static const profile = '/profile';

  // ── Discovery ─────────────────────────────────────────────────────────────
  static const search = '/search';

  /// "See all" restaurant lists, e.g. `/restaurants?section=places_near_you`.
  static const restaurantList = '/restaurants';
  static String restaurantListFor({required String section, String? title}) =>
      Uri(
        path: restaurantList,
        queryParameters: {'section': section, 'title': ?title},
      ).toString();

  // ── Restaurant ────────────────────────────────────────────────────────────
  static const restaurantPath = '/restaurant/:restaurantId';
  static String restaurant(String id) => '/restaurant/$id';

  static const restaurantReviewsPath = '/restaurant/:restaurantId/reviews';
  static String restaurantReviews(String id) => '/restaurant/$id/reviews';

  static const restaurantMenuSearchPath =
      '/restaurant/:restaurantId/menu-search';
  static String restaurantMenuSearch(String id) =>
      '/restaurant/$id/menu-search';

  static const menuItemPath = '/restaurant/:restaurantId/item/:itemId';
  static String menuItem(String restaurantId, String itemId) =>
      '/restaurant/$restaurantId/item/$itemId';

  // ── Checkout & orders ─────────────────────────────────────────────────────
  static const checkoutPath = '/checkout/:restaurantId';
  static String checkout(String restaurantId) => '/checkout/$restaurantId';

  static const orderPath = '/orders/:orderId';
  static String order(String orderId) => '/orders/$orderId';

  static const orderTimelinePath = '/orders/:orderId/timeline';
  static String orderTimeline(String orderId) => '/orders/$orderId/timeline';

  // ── Profile ───────────────────────────────────────────────────────────────
  static const addMoney = '/account/wallet/add-money';
  static const walletActivity = '/account/wallet/activity';
  static const updatePhone = '/account/phone';
  static const changePassword = '/account/password';
  static const editProfile = '/account/profile';
  static const notificationPreferences = '/account/notifications';
  static const notificationChannelPath = '/account/notifications/:channel';
  static String notificationChannel(String channel) =>
      '/account/notifications/$channel';
  static const accessibility = '/account/accessibility';
  static const rewards = '/account/rewards';
  static const language = '/account/language';

  // ── Support ───────────────────────────────────────────────────────────────
  static const help = '/support';
  static const helpTopicPath = '/support/topics/:topicId';
  static String helpTopic(String topicId) => '/support/topics/$topicId';
  static const helpArticlePath = '/support/articles/:articleId';
  static String helpArticle(String articleId) => '/support/articles/$articleId';
  static const supportChat = '/support/chat';

  /// Routes reachable without finishing the welcome flow.
  static bool isOnboardingLocation(String location) =>
      location == splash ||
      location.startsWith(welcome) ||
      location.startsWith('/auth') ||
      location.startsWith(locationIntro);
}
