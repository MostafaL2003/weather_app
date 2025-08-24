import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeatherByCity(String cityName) async {
    final String apiKey = "06c4ab41f071e5b64170233cb263f3cc";
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$apiKey",
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
