import 'package:url_launcher/url_launcher.dart';

class NavigationService {
  Future<void> openGoogleMapsDirections(
      double originLatitude, double originLongitude,
      double destinationLatitude, double destinationLongitude) async {
    final url =
        'https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
