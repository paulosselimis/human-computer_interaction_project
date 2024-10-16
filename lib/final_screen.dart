import 'package:flutter/material.dart';
import 'main.dart';

class FinalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 3, 24, 34),
        ), // Set the color of the back arrow
        backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      ),
      backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      body: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Center the title horizontally and vertically
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(
                  'Congratulations!',
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
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Text(
                'You completed \nyour \nDaily Meditation',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            // Provide spacing for the second text
            //    SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                'You receive:',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '+1',
                    style: TextStyle(fontSize: 35.0, color: Colors.white),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.emoji_events,
                    size: 60.0,
                    color: Color.fromARGB(255, 192, 136, 202),
                  ),
                ],
              ),
            ),

            SizedBox(height: 90.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press, e.g., navigate to the next screen
                // You can use Navigator.push() to navigate to the next screen
                // Navigate to the second screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Container(
                width: 200.0,
                height: 50.0,
                child: Center(
                  child: Text(
                    'HOME',
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
