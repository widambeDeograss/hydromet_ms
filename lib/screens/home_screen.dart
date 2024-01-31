import 'package:flutter/material.dart';
import 'package:hydromet_ms/screens/report_screen.dart';

import 'education_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydromet Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLocationInfo('Dar es Salaam'),
                const SizedBox(height: 24),
                _buildAlertsSection(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality for refreshing data
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReportScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
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
                ),
                const SizedBox(height: 24),
                _buildEducationalContent(),
                const SizedBox(height: 24),
                _buildNewsFeed(),
              ],
            ),
          ),
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
            backgroundColor: Colors.blue,
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Image(
                image: AssetImage('assets/images/tips.jpg'),
              ),
              title: const Text(
                'Education Content',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                children: [
                  const Text(
                    'Learn about the impact of water quality on the environment and health.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.arrow_forward,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'view more',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
            ), // Add more news feed items as needed
          ],
        ),
      ),
    );
  }
}
