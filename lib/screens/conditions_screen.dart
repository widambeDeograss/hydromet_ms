import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydromet Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Conditions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildConditionCard(Icons.waves, 'Water Level', 'Normal'),
                _buildConditionCard(Icons.cloud, 'Rainfall', 'Low'),
                _buildConditionCard(Icons.thermostat, 'Temperature', '23°C'),
                _buildConditionCard(Icons.opacity, 'Humidity', '65%'),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Water Flow Rate Changes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 300,
              child: LineChart(
                _buildWaterFlowRateChart(),
              ),
            ),
            SizedBox(height: 24),
            _buildPHCard('pH', '7.2',
                'The water is safe for consumption.'), // pH card with value '7.2' (replace with actual pH data)
          ],
        ),
      ),
    );
  }

  Widget _buildConditionCard(IconData icon, String title, String value) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildPHCard(String title, String value, String comment) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.opacity, size: 40, color: Colors.blue),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Divider(height: 1, color: Colors.grey),
            SizedBox(height: 16),
            Text(comment, style: TextStyle(fontSize: 16, color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  LineChartData _buildWaterFlowRateChart() {
    return LineChartData(
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(show: false),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.blue, width: 1),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 4),
            FlSpot(2, 3.5),
            FlSpot(3, 2),
            FlSpot(4, 3),
            FlSpot(5, 2.5),
            FlSpot(6, 1),
            FlSpot(7, 1.5),
            FlSpot(8, 2.5),
            FlSpot(9, 2),
            FlSpot(10, 3),
          ],
          isCurved: true,
          color: Colors.blue,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
