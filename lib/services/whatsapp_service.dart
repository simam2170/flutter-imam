import 'package:url_launcher/url_launcher.dart';
import '../services/cart_service.dart';

class WhatsAppService {
  static Future<void> openWhatsApp() async {
    final phoneNumber = "6282328786328"; 
    final message = _buildMessage();

    final url =
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka WhatsApp';
    }
  }

  static String _buildMessage() {
    final items = CartService.items;

    String message = "🛒 *Order Baru*\n\n";

    for (var item in items) {
      message +=
          "- ${item.name} x${item.quantity} = Rs. ${item.total.toStringAsFixed(2)}\n";
    }

    message += "\n💰 *Total:* Rs. ${CartService.totalPrice.toStringAsFixed(2)}";

    return message;
  }
}
