import 'package:url_launcher/url_launcher.dart';

class PhoneService {
  final String phoneNumber;

  PhoneService(this.phoneNumber);

  Future<void> dialPhoneNumber() async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    try {
      await launchUrl(phoneUri);
    } catch (e) {
      print('Error launching dialer: $e');
      throw 'Could not launch $phoneUri';
    }
  }
}
