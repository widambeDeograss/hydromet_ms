import 'package:flutter/material.dart';

class EducationContent extends StatefulWidget {
  const EducationContent({super.key});

  @override
  State<EducationContent> createState() => _EducationContentState();
}

class _EducationContentState extends State<EducationContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tips",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/images/heavy_rain',
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEAVY RAINFALL',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum dui sed libero sagittis, '
                          'ut placerat diam dapibus. Aenean congue tristique augue eu lobortis. Proin faucibus purus '
                          'aliquam ',
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
