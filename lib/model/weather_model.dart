class WeatherModel {
  final double temperature;
  final double minTemp;
  final double maxTemp;
  final String condition;

  WeatherModel({
    required this.temperature,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
  });

  WeatherModel.fromJson(Map<String, dynamic> json)
    : temperature = json['main']['temp'].toDouble().roundToDouble(),
      minTemp = json['main']['temp_min'].toDouble(),
      maxTemp = json['main']['temp_max'].toDouble(),
      condition = json['weather'][0]['main'].toString();
}
