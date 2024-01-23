import 'package:flutter/material.dart';
import 'package:hydromet_ms/screens/conditions_screen.dart';
import 'package:hydromet_ms/screens/home_screen.dart';
import 'package:hydromet_ms/screens/predictions_screen.dart';
import 'package:hydromet_ms/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydromet Ms',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const MySplashScreen(),
    );
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  int _currentIndex = 0;
  final List<Widget> _splashScreens = [
    const SplashScreen(
      title: 'Welcome to Hydromet',
      description: 'Empowering You with Water Metrics',
      image: 'assets/images/geolocation.png',
    ),
    const SplashScreen(
      title: 'Real-time Conditions',
      description: 'Stay Informed about Current Water Conditions',
      image: 'assets/images/geolocation.png',
    ),
    const SplashScreen(
      title: 'Accurate Predictions',
      description: 'Explore Reliable Water Predictions for the Future',
      image: 'assets/images/geolocation.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _splashScreens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  if (_currentIndex > 0 && _currentIndex == 0) {
                    setState(() {
                      _currentIndex + 2;
                    });
                  } else if (_currentIndex > 0 && _currentIndex == 1) {
                    setState(() {
                      _currentIndex + 1;
                    });
                  }
                },
                child: const Text('Skip'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_currentIndex < _splashScreens.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyBottomNavigationBar()),
                    );
                  }
                },
                child: Text(_currentIndex < _splashScreens.length - 1
                    ? 'Next'
                    : 'Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    ConditionsScreen(),
    PredictionsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomNavigate,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Conditions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Predictions',
          ),
        ],
      ),
    );
  }

  void bottomNavigate(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
