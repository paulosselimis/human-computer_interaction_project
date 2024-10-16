import 'package:daily_meditation/third_screen.dart';
import 'package:flutter/material.dart';

class BluetoothScreen extends StatelessWidget {
  final int counter;

  BluetoothScreen({required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white), // Set the color of the back arrow
        backgroundColor: const Color.fromARGB(255, 3, 24, 34),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to a specific screen when the back arrow is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThirdScreen(),
              ),
            );
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '   You have \n successfully \n  completed:',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 70),
            Text(
              '$counter',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 192, 136, 202)),
            ),
            Text(
              'meditation sessions \n             so far.',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 200),
            Text(
              'Keep going!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
