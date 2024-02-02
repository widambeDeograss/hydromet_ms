import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hydromet_ms/api/api.dart';

class ConditionsScreen extends StatefulWidget {
  const ConditionsScreen({Key? key}) : super(key: key);

  @override
  _ConditionsScreenState createState() => _ConditionsScreenState();
}

class _ConditionsScreenState extends State<ConditionsScreen> {
  var hyd_conditions;
  late Timer _timer;
  late dynamic flowRateDat;

  void get_conditions() async {
    ApiRequest api = ApiRequest();
    var uridata = "/api/latest_data";

    try {
      var response = await api.get(uridata);
      print(response);
      setState(() {
        hyd_conditions = response;
        flowRateDat = response?["flow_rate_data"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // Initial data fetch
    get_conditions();

    // Periodic data fetch every 2 seconds
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      get_conditions();
    });

    super.initState();
  }

  @override
  void dispose() {
    // Cancel the timer to prevent memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydromet Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Conditions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildConditionCard(
                  Icons.waves,
                  'Water Level',
                  hyd_conditions?['water_level_data']?[2] ?? 'N/A',
                ),
                _buildConditionCard(
                  Icons.cloud,
                  'Rainfall',
                  hyd_conditions?['rain_fall']?[2] ?? 'N/A',
                ),
                _buildConditionCard(
                  Icons.thermostat,
                  'Temperature',
                  hyd_conditions?['temperature_data'] ?? 'N/A',
                ),
                _buildConditionCard(Icons.opacity, 'Humidity',
                    "${hyd_conditions?['moisture_data']?[2] ?? 'N/A'},"),
              ],
            ),
            SizedBox(height: 14),
            const Text(
              'Water Flow Rate Changes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              height: 250,
              child: LineChart(
                _buildWaterFlowRateChart(),
              ),
            ),
            const SizedBox(height: 16),
            _buildPHCard(
                'pH',
                "${hyd_conditions?['ph_data']?[2] ?? 'N/A'} : ${hyd_conditions?['ph_data']?[3] ?? 'N/A'}",
                hyd_conditions?['ph_data']?[3] == "MODERATE"
                    ? "The water is not safe for consumption"
                    : "The Water is not safe for consumption"), // pH card with value '7.2' (replace with actual pH data)
          ],
        ),
      ),
    );
  }

  Widget _buildConditionCard(IconData icon, String title, String value) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.blue),
              SizedBox(height: 8),
              Text(title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPHCard(String title, String value, String comment) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Icon(Icons.opacity, size: 30, color: Colors.blue),
              const SizedBox(height: 8),
              Text(title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(value, style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Divider(height: 1, color: Colors.grey),
              SizedBox(height: 10),
              Text(comment,
                  style: const TextStyle(fontSize: 13, color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData _buildWaterFlowRateChart() {
    List<FlSpot> spots = [];

    for (int i = 0; i < flowRateDat.length; i++) {
      spots.add(
          FlSpot(i.toDouble(), flowRateDat[i]["timestamp"].toDouble() * 0.04));
    }
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.blue, width: 1),
      ),
      minX: 0,
      maxX: flowRateDat.length.toDouble() - 1,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.blue,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
