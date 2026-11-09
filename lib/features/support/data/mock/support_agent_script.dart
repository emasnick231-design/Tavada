/// Scripted replies for the fake support agent ("Mollie").
///
/// Picks an intent from the customer's pending messages and returns a
/// localized reply plus an optional wallet credit, so the demo conversation
/// from the design ("…you should see the amount back in your account soon")
/// really refunds the wallet.
class AgentReply {
  const AgentReply(this.text, {this.walletCredit = 0});

  final String text;

  /// Amount (GBP) credited to the customer's wallet, 0 for none.
  final double walletCredit;
}

enum _Intent {
  photo,
  specialRequest,
  missing,
  condition,
  late,
  cancel,
  thanks,
  greeting,
  fallback,
}

abstract final class SupportAgentScript {
  static const agentName = 'Mollie';
  static const agentAvatar = 'assets/images/avatars/support_agent.jpg';

  static const refundReason = {
    'en': 'Refund from support',
    'tr': 'Destek iadesi',
  };

  /// Checked in order — the first matching intent wins.
  static const _keywords = <_Intent, List<String>>{
    _Intent.specialRequest: [
      'ketchup', 'mustard', 'sauce', 'request', 'comment', //
      'ketçap', 'hardal', 'sos', 'istek',
    ],
    _Intent.missing: ['missing', 'forgot', 'wrong', 'eksik', 'yanlış'],
    _Intent.condition: [
      'cold', 'warm', 'melted', 'damaged', 'spilled', 'broken', 'crushed', //
      'soğuk', 'ılık', 'hasar', 'döküldü', 'ezik',
    ],
    _Intent.late: ['where', 'late', 'delay', 'nerede', 'gecik'],
    _Intent.cancel: ['cancel', 'iptal'],
    _Intent.thanks: ['thank', 'thanks', 'appreciate', 'teşekkür', 'sağol'],
    _Intent.greeting: ['hi', 'hello', 'hey', 'merhaba', 'selam'],
  };

  static _Intent _detect(String text, {required bool hasPhoto}) {
    if (hasPhoto) return _Intent.photo;
    final words = text.toLowerCase().split(RegExp('[^a-zçğıöşü]+'));
    for (final entry in _keywords.entries) {
      final hit = words.any(
        (w) =>
            entry.value.any((k) => w == k || (k.length > 3 && w.startsWith(k))),
      );
      if (hit) return entry.key;
    }
    return _Intent.fallback;
  }

  static AgentReply reply({
    required String pendingText,
    required bool hasPhoto,
    required String lang,
    String? customerName,
  }) {
    final tr = lang == 'tr';
    final name = (customerName?.isEmpty ?? true) ? null : customerName;
    // "So sorry about that, Vanessa!" / "Vanessa, …"
    final en = name == null ? '' : ', $name';
    final trPrefix = name == null ? '' : '$name, ';

    return switch (_detect(pendingText, hasPhoto: hasPhoto)) {
      _Intent.photo => AgentReply(
        tr
            ? '${trPrefix}fotoğraf için teşekkürler — bu kesinlikle olmaması '
                  'gereken bir durum. Ürünün tutarını cüzdanınıza iade ettim.'
            : 'Thanks for the photo$en — that’s definitely not right. I’ve '
                  'refunded the item to your wallet.',
        walletCredit: 4.5,
      ),
      _Intent.specialRequest => AgentReply(
        tr
            ? '${trPrefix}bunun için çok üzgünüm! İade işlemini başlattım; '
                  'tutar kısa süre içinde hesabınızda olacak. Başka bir şeye '
                  'ihtiyacınız olursa yazmanız yeterli!'
            : 'So sorry about that$en! I’ve processed a refund for the item, '
                  'and you should see the amount back in your account soon. '
                  'Let us know if you need anything else!',
        walletCredit: 3.5,
      ),
      _Intent.missing => AgentReply(
        tr
            ? 'Eksik ürünler için gerçekten üzgünüm. Cüzdanınıza £5,00 kredi '
                  'ekledim — bir sonraki siparişinizde kullanabilirsiniz.'
            : 'I’m really sorry some items were missing. I’ve added £5.00 '
                  'credit to your wallet — it’s ready for your next order.',
        walletCredit: 5,
      ),
      _Intent.condition => AgentReply(
        tr
            ? 'Ah hayır! Yemeğiniz kusursuz gelmediği için üzgünüm. + '
                  'düğmesiyle bir fotoğraf paylaşır mısınız? Hemen çözelim.'
            : 'Oh no! I’m sorry your food didn’t arrive in perfect '
                  'condition. Could you share a photo with the + button so I '
                  'can sort this out quickly?',
      ),
      _Intent.late => AgentReply(
        tr
            ? 'Hemen kontrol ediyorum… Kuryeniz yolda ve yaklaşık 10 dakika '
                  'içinde yanınızda olacak. Sepet sekmesinden canlı takip '
                  'edebilirsiniz.'
            : 'Let me check… Your rider is on the way and should be with you '
                  'in about 10 minutes. You can follow them live from the '
                  'Basket tab.',
      ),
      _Intent.cancel => AgentReply(
        tr
            ? 'Yardımcı olabilirim. Restoran hazırlamaya başlamadıysa '
                  'siparişinizi tam iade ile iptal edebilirim — devam edeyim '
                  'mi?'
            : 'I can help with that. If the restaurant hasn’t started '
                  'preparing your order, I can cancel it for a full refund — '
                  'shall I go ahead?',
      ),
      _Intent.thanks => AgentReply(
        tr
            ? (name == null ? 'Rica ederim!' : 'Rica ederim $name!')
            : (name == null ? 'For sure!' : 'For sure $name'),
      ),
      _Intent.greeting => AgentReply(
        tr
            ? 'Merhaba${name == null ? '' : ' $name'}! Size bugün nasıl '
                  'yardımcı olabilirim?'
            : 'Hi${name == null ? ' there' : ' $name'}! How can I help you '
                  'today?',
      ),
      _Intent.fallback => AgentReply(
        tr
            ? 'Bize ulaştığınız için teşekkürler. Siparişinizde neler olduğunu '
                  'biraz daha anlatır mısınız? Hemen yardımcı olayım.'
            : 'Thanks for reaching out$en. Could you tell me a little more '
                  'about what happened with your order so I can help right '
                  'away?',
      ),
    };
  }

  /// System line shown when the agent picks up the chat.
  static String joinedMessage(String lang) => lang == 'tr'
      ? '$agentName sohbete katıldı'
      : '$agentName joined the chat';
}
