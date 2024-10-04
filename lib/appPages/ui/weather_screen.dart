// lib/ui/weather_screen.dart
import 'package:flutter/material.dart';
import '../../services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  const WeatherScreen({super.key, required this.latitude, required this.longitude});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? _weatherData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    try {
      final data = await _weatherService.fetchWeather(widget.latitude, widget.longitude);
      setState(() {
        _weatherData = data;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching weather: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _weatherData == null
          ? const Center(child: Text('Failed to load weather data'))
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Weather: ${_weatherData!['weather'][0]['description']}'),
            Text('Temperature: ${(_weatherData!['main']['temp'] - 273.15).toStringAsFixed(2)}°C'),
          ],
        ),
      ),
    );
  }
}
