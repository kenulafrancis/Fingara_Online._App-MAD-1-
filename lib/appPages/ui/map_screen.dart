import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../services/geolocation_service.dart';
import '../../services/navigation_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GeolocationService _geolocationService = GeolocationService();
  final NavigationService _navigationService = NavigationService();

  LatLng? _userLocation;
  final LatLng _venueLocation = const LatLng(6.851568580868057, 79.89923503921392);

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    try {
      final position = await _geolocationService.getCurrentLocation();
      setState(() {
        _userLocation = LatLng(position.latitude, position.longitude);
      });
    } catch (e) {
      print('Error fetching location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Map')),
      body: _userLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _userLocation!,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('userLocation'),
            position: _userLocation!,
          ),
          Marker(
            markerId: const MarkerId('venueLocation'),
            position: _venueLocation,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_userLocation != null) {
            _navigationService.openGoogleMapsDirections(
              _userLocation!.latitude,
              _userLocation!.longitude,
              _venueLocation.latitude,
              _venueLocation.longitude,
            );
          }
        },
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
