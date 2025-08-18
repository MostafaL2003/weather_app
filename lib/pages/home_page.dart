import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> hourlyData = [
    {"time": "10 AM", "temp": "30°", "icon": Icons.wb_sunny},
    {"time": "11 AM", "temp": "31°", "icon": Icons.wb_sunny},
    {"time": "12 PM", "temp": "32°", "icon": Icons.cloud},
    {"time": "1 PM", "temp": "33°", "icon": Icons.wb_sunny},
    {"time": "2 PM", "temp": "34°", "icon": Icons.wb_cloudy},
  ];
  final List<Map<String, dynamic>> dailyData = [
    {"day": "Monday", "temp": "30°", "icon": Icons.wb_sunny},
    {"day": "Tuesday", "temp": "28°", "icon": Icons.wb_cloudy},
    {"day": "Wednesday", "temp": "29°", "icon": Icons.beach_access},
    {"day": "Thursday", "temp": "31°", "icon": Icons.wb_sunny},
    {"day": "Friday", "temp": "27°", "icon": Icons.cloud},
    {"day": "Saturday", "temp": "32°", "icon": Icons.wb_sunny},
    {"day": "Sunday", "temp": "26°", "icon": Icons.grain},
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF89f7fe), Color.fromARGB(255, 232, 130, 241)],
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
                    SizedBox(height: 80),
                    Image.asset("assets/weather.png", height: 180),
                    Text(
                      "30°",
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
                      "Max.:32° Min.:28°",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.95),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 115, 235, 243),
                            Color.fromARGB(255, 215, 112, 222),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(8, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Today",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white.withOpacity(0.95),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  "69 March",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.white.withOpacity(0.95),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
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
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color.fromARGB(255, 115, 235, 243),
                                            Color.fromARGB(255, 215, 112, 222),
                                          ],
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white.withOpacity(
                                              0.3,
                                            ),
                                            blurRadius: 8,
                                            offset: Offset(1, 4),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 30),
                                          Text(
                                            hour["temp"],
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.white.withOpacity(
                                                0.95,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset(
                                            "assets/weather.png",
                                            height: 50,
                                          ),
                                          Spacer(),
                                          Text(
                                            hour["time"],
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              color: Colors.white.withOpacity(
                                                0.95,
                                              ),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                        ],
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
                    SizedBox(height: 25),
                    Container(
                      constraints: BoxConstraints(maxHeight: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 115, 235, 243),
                            Color.fromARGB(255, 215, 112, 222),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(8, 8),
                          ),
                        ],
                      ),
                      child: ListView.builder(
                        itemCount: dailyData.length,
                        itemBuilder: (context, index) {
                          final daily = dailyData[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color.fromARGB(255, 115, 235, 243),
                                    Color.fromARGB(255, 215, 112, 222),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: Offset(1, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 20),
                                        Text(
                                          daily["day"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(
                                              0.95,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Image.asset(
                                          "assets/weather.png",
                                          height: 50,
                                        ),
                                        Spacer(),
                                        Text(
                                          daily["temp"],
                                          style: GoogleFonts.poppins(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(
                                              0.95,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                      ],
                                    ),
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
