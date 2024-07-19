import 'package:flutter/material.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("WEATHER PREDICTIONS")],
      ),
    );
    // ignore: dead_code
    throw UnimplementedError();
  }
}
