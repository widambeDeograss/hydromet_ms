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
  List<dynamic> hyd_conditions = [];
  late Timer _timer;
  List<dynamic> flowRateDat = [];

  void get_conditions() async {
    ApiRequest api = ApiRequest();
    var uridata = "/api/data/";

    try {
      var response = await api.get(uridata);
      setState(() {
        hyd_conditions = response["data"] ?? [];
        flowRateDat =
            hyd_conditions.map((item) => item["flowRate"] ?? 0.0).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    // Initial data fetch
    get_conditions();

    // Periodic data fetch every 30 seconds
    _timer = Timer.periodic(const Duration(seconds: 30), (Timer timer) {
      get_conditions();
    });
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
        title: const Text('Hydromet Conditions'),
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
                  hyd_conditions.isNotEmpty
                      ? hyd_conditions.last['waterLevel'].toString()
                      : 'N/A',
                ),
                _buildConditionCard(
                  Icons.cloud,
                  'Rainfall',
                  hyd_conditions.isNotEmpty
                      ? hyd_conditions.last['rainfall'].toString()
                      : 'N/A',
                ),
                _buildConditionCard(
                  Icons.opacity,
                  'Humidity',
                  hyd_conditions.isNotEmpty
                      ? hyd_conditions.last['soilMoisture'].toString()
                      : 'N/A',
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Text(
              'Water Flow Rate Changes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: flowRateDat.isNotEmpty
                  ? LineChart(_buildWaterFlowRateChart())
                  : const Center(child: Text("No data available")),
            ),
            const SizedBox(height: 16),
            _buildPHCard(
              'pH',
              hyd_conditions.isNotEmpty
                  ? "${hyd_conditions.last['pHValue']} : ${hyd_conditions.last['pHStatus']}"
                  : 'N/A',
              hyd_conditions.isNotEmpty &&
                      hyd_conditions.last['pHStatus'] == "MODERATE"
                  ? "The water is safe for consumption"
                  : "The Water is not safe for consumption",
            ),
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
              const SizedBox(height: 8),
              Text(title,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPHCard(String title, String value, String comment) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Icon(Icons.opacity, size: 30, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Divider(height: 1, color: Colors.grey),
            const SizedBox(height: 10),
            Text(comment,
                style: const TextStyle(fontSize: 13, color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  LineChartData _buildWaterFlowRateChart() {
    List<FlSpot> spots = [];

    for (int i = 0; i < flowRateDat.length; i++) {
      spots.add(FlSpot(i.toDouble(), flowRateDat[i] * 0.04));
    }

    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.blue, width: 1),
      ),
      minX: 0,
      maxX: spots.isNotEmpty ? spots.length.toDouble() - 1 : 0,
      minY: spots.isNotEmpty
          ? spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b)
          : 0,
      maxY: spots.isNotEmpty
          ? spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b)
          : 6,
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
