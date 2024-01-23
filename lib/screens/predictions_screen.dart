import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PredictionsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> carouselItems = [
    {
      'precaution': 'Secure valuable items at a higher level during floods.',
      'icon': Icons.warning,
    },
    {
      'precaution':
          'Avoid drinking water from unknown sources during high pH levels.',
      'icon': Icons.local_drink,
    },
    {
      'precaution':
          'Stay informed about weather conditions and water quality changes.',
      'icon': Icons.info,
    },
  ];

  final List<String> predictions = [
    'Predicted decrease in water levels next week.',
    'Anticipated heavy rainfall in the coming days.',
    'Expected fluctuations in pH levels over the weekend.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hydromet Predictions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Precautions and Predictions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildCarousel(),
            const SizedBox(height: 24),
            _buildPredictions(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
      ),
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item['icon'],
                      size: 40,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['precaution'],
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildPredictions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Necessary Predictions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        for (String prediction in predictions) _buildPredictionCard(prediction),
      ],
    );
  }

  Widget _buildPredictionCard(String prediction) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.orange,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                prediction,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
