// lib/services/weather_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  final String apiKey = '6e4fdfbca13775ec3e09cd3875a0377f';

  Future<Map<String, dynamic>> fetchWeather(double latitude, double longitude) async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
