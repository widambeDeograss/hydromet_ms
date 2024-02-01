import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hydromet_ms/screens/report_screen.dart';

import '../components/news.dart';
import '../components/newsCard.dart';
import 'education_content.dart';
import 'news_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final spinkit = SpinKitFadingCircle(
    color: Colors.blue.shade400,
    size: 50.0,
    duration: const Duration(seconds: 3),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hydromet Dashboard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                    RawMaterialButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              elevation: 5.0,
                              insetPadding: const EdgeInsets.all(15.0),
                              backgroundColor: Colors.transparent,
                              content: Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                child: spinkit,
                              ),
                            );
                          },
                        );
                      },
                      elevation: 0.0,
                      constraints: const BoxConstraints.tightFor(
                        width: 110.0,
                        height: 50.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          width: 1,
                        ),
                      ),
                      fillColor: Colors.blueAccent,
                      child: const Text(
                        'Refresh Data',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReportScreen()));
                      },
                      elevation: 0.0,
                      constraints: const BoxConstraints.tightFor(
                        width: 110.0,
                        height: 50.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          width: 1,
                        ),
                      ),
                      fillColor: Colors.orangeAccent,
                      child: const Text(
                        'Report Issue',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Image.asset(
                            'assets/images/tips.jpg',
                            fit: BoxFit.cover,
                          ),
                          title: const Text(
                            'Education Content',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            'Learn about the impact of water quality on the environment and health.',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                          width: 200.0,
                          child: Divider(
                            color: Colors.teal[100],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EducationContent(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 90.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'view more',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
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
              leading: Icon(
                Icons.warning,
                color: Colors.red,
                size: 36,
              ),
              title: Text(
                'High Water Levels Detected!',
                style: TextStyle(fontSize: 15),
              ),
              subtitle: Text(
                'Please take necessary precautions.',
                style: TextStyle(fontSize: 15),
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
            style: TextStyle(fontSize: 15),
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
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildNewsFeed() {
    final List<News> newsList = [
      News(
        title: 'Flood Alert',
        content: 'Heavy rainfall expected in the region. Be cautious!',
        imageUrl:
            'https://www.science.org/do/10.1126/science.abl5271/full/germanyfloods_1280x720-1644902881893.jpg',
      ),
      News(
        title: 'Hydromet Conference',
        content: 'Join us for the annual Hydromet Conference next week.',
        imageUrl:
            'https://www.science.org/do/10.1126/science.abl5271/full/germanyfloods_1280x720-1644902881893.jpg',
      ),
      News(
        title: 'River Monitoring',
        content: 'Latest river levels indicate normal conditions.',
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQl4PVsVZR9b75KjwGFrxikPG8Ezia5dpY5CX5gfzYTFfLZpvOGN_d8qTm1_0SvFyATurc&usqp=CAU',
      ),
      News(
        title: 'Weather Forecast',
        content: 'Sunny skies expected for the upcoming days.',
        imageUrl:
            'https://www.fondriest.com/environmental-measurements/wp-content/uploads/2015/08/riverstream_installationconsider.jpg',
      ),
    ];
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'News Feed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200, // Adjust the height as needed
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    news: newsList[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailScreen(news: newsList[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
