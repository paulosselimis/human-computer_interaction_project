import 'package:flutter/material.dart';
import 'second_screen.dart';
//import 'final_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeditation',
      home: MainScreen(),
      debugShowCheckedModeBanner: false, // Set this to false
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Color.fromARGB(
                255, 177, 143, 206)), // Set the color of the back arrow
        backgroundColor: Color.fromARGB(255, 177, 143, 206),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/jon-r8AFUpRp0J0-unsplash.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center the title horizontally and vertically
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Text(
                  'DailyMeditation',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //   SizedBox(height: 1.0),

            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Text(
                'Hi User, Welcome \nto DailyMeditation',
                style: TextStyle(
                    fontSize: 18.0, color: Color.fromARGB(255, 255, 255, 255)),
                textAlign: TextAlign.center,
              ),
            ),
            // Provide spacing for the second text
            //    SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'Sometimes, the most productive \nthing you can do is relax.',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 60.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press, e.g., navigate to the next screen
                // You can use Navigator.push() to navigate to the next screen
                // Navigate to the second screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Container(
                width: 200.0,
                height: 50.0,
                child: Center(
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 192, 136, 202), //B399CD
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
