import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/citylist.dart';

void main() {
  runApp(const MyWidget());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const apiKey = "249ce72a6487835210d04ef0ee2ac92f";

  final WeatherFactory _wf = WeatherFactory(apiKey);

  Weather? _weather;
  String city = "pokhara";

  @override
  void initState() {
    super.initState();
    _wf.currentWeatherByCityName(city).then((w) {
      setState(() {
        _weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.white, Colors.black],
                radius: 8,
                focalRadius: 50)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        return setState(() {
                          SizedBox(
                              height: 50,
                              width: 50,
                              child: Card(color: Colors.black));
                        });
                      },
                      icon: const Icon(Icons.location_pin, size: 50),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _weather?.areaName?.toUpperCase() ?? "",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3),
                    ),
                    const SizedBox(width: 30),
                  ],
                ),
                Text(
                  DateFormat("EEEE").format(_weather!.date!),
                  style: const TextStyle(fontSize: 20, color: Colors.black45),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"))),
                ),
                Text(
                  "${_weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
                  style: const TextStyle(
                      fontFamily: 'fontnew',
                      fontSize: 80,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      shadows: [Shadow(color: Colors.grey, blurRadius: 12)]),
                )
              ],
            ),
            Text(
              _weather?.weatherDescription ?? "",
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      )),
    );
  }
}
