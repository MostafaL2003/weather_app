import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? currentWeather;
  WeatherService weatherService = WeatherService();
  String cityName = "Giza";
  String weatherCondition = "";

  // دالة لتحديد صورة حالة الطقس
  String getWeatherImage() {
    if (weatherCondition == "Clear") return "assets/sunny.png";
    if (weatherCondition == "Clouds") return "assets/cloudy.png";
    if (weatherCondition == "Rain") return "assets/rain.png";
    if (weatherCondition == "Snow") return "assets/snow.png";
    return "assets/weather.png";
  }

  // دالة لتحديد أيقونة الطقس
  IconData getWeatherIcon(String condition) {
    switch (condition) {
      case "Clear":
        return Icons.wb_sunny;
      case "Clouds":
        return Icons.cloud;
      case "Rain":
        return Icons.beach_access;
      case "Snow":
        return Icons.ac_unit;
      default:
        return Icons.wb_sunny;
    }
  }

  Future<void> fetchWeather(String city) async {
    try {
      WeatherModel weather = await weatherService.getWeatherByCity(city);
      setState(() {
        currentWeather = weather;
        weatherCondition = weather.condition;
      });
    } catch (e) {
      print("Error fetching weather: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather(cityName);
  }

  final List<Map<String, dynamic>> hourlyData = [
    {"time": "10 AM", "temp": "30°", "condition": "Clear"},
    {"time": "11 AM", "temp": "31°", "condition": "Clouds"},
    {"time": "12 PM", "temp": "32°", "condition": "Rain"},
    {"time": "1 PM", "temp": "33°", "condition": "Clear"},
    {"time": "2 PM", "temp": "34°", "condition": "Clouds"},
  ];

  final List<Map<String, dynamic>> dailyData = [
    {"day": "Monday", "temp": "30°", "condition": "Clear"},
    {"day": "Tuesday", "temp": "28°", "condition": "Clouds"},
    {"day": "Wednesday", "temp": "29°", "condition": "Rain"},
    {"day": "Thursday", "temp": "31°", "condition": "Clear"},
    {"day": "Friday", "temp": "27°", "condition": "Clouds"},
    {"day": "Saturday", "temp": "32°", "condition": "Clear"},
    {"day": "Sunday", "temp": "26°", "condition": "Snow"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 18, 79, 129),
            Color.fromARGB(255, 7, 30, 50),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    // اختيار المدينة
                    InkWell(
                      onTap: () async {
                        final newCity = await showDialog<String>(
                          context: context,
                          builder: (context) {
                            String tempCity = "";
                            return AlertDialog(
                              title: const Text("Choose city."),
                              content: TextField(
                                onChanged: (value) {
                                  tempCity = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: "e.g London",
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, tempCity);
                                  },
                                  child: const Text("Save"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                              ],
                            );
                          },
                        );
                        if (newCity != null && newCity.isNotEmpty) {
                          setState(() {
                            cityName = newCity;
                          });
                          fetchWeather(newCity);
                        }
                      },
                      child: Text(
                        cityName,
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 3,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(1, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // صورة الطقس
                    Image.asset(getWeatherImage(), height: 180),
                    const SizedBox(height: 20),
                    // درجة الحرارة
                    Text(
                      currentWeather != null
                          ? "${currentWeather!.temperature.toStringAsFixed(0)}°"
                          : "Loading...",
                      style: GoogleFonts.poppins(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Preciptations",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.95),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      currentWeather != null
                          ? "Max.:${currentWeather!.maxTemp.toStringAsFixed(0)}° Min.:${currentWeather!.minTemp.toStringAsFixed(0)}°"
                          : "Max.:-- Min.:--",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.95),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // الساعات
                    Container(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hourlyData.length,
                        itemBuilder: (context, index) {
                          final hour = hourlyData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 18, 79, 129),
                                    Color.fromARGB(255, 7, 30, 50),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    hour["time"],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 5),
                                  Icon(
                                    getWeatherIcon(hour["condition"]),
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    hour["temp"],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    // الأيام
                    Container(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: ListView.builder(
                        itemCount: dailyData.length,
                        itemBuilder: (context, index) {
                          final daily = dailyData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 18, 79, 129),
                                    Color.fromARGB(255, 7, 30, 50),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Text(
                                      daily["day"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      getWeatherIcon(daily["condition"]),
                                      color: Colors.white,
                                    ),
                                    Spacer(),
                                    Text(
                                      daily["temp"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
