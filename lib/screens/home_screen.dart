import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydromet Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLocationInfo('Dar es Salaam'),
            const SizedBox(height: 24),
            _buildAlertsSection(),
            const SizedBox(height: 24),
            _buildActionButtons(),
            const SizedBox(height: 24),
            _buildEducationalContent(),
            const SizedBox(height: 24),
            _buildNewsFeed(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationInfo(String location) {
    return Text(
      'Current Location: $location',
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildAlertsSection() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alerts and Notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Display real-time alerts or notifications here
            ListTile(
              leading: Icon(Icons.warning, color: Colors.red, size: 36),
              title: Text(
                'High Water Levels Detected!',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                'Please take necessary precautions.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Add more alerts as needed
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // Add functionality for refreshing data
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            'Refresh Data',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for accessing settings
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            'Settings',
            style: TextStyle(fontSize: 16),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Add functionality for reporting issues
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          child: const Text(
            'Report Issue',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildEducationalContent() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Educational Content',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Add educational content here
            Text(
              'Learn about the impact of water quality on the environment and health.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more educational content as needed
          ],
        ),
      ),
    );
  }

  Widget _buildNewsFeed() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'News Feed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Display news feed or blog updates here
            ListTile(
              title: Text(
                'New Hydromet Sensor Installed in Dar es Salaam',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                'Stay informed about the latest developments.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Add more news feed items as needed
          ],
        ),
      ),
    );
  }
}
