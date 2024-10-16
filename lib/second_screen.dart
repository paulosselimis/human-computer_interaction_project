// second_screen.dart

import 'package:flutter/material.dart';
import 'time_picker.dart';
import 'package:day_picker/day_picker.dart'; // Make sure to import the necessary package
import 'third_screen.dart';

final List<DayInWeek> _days = [
  DayInWeek("SU", dayKey: "monday"),
  DayInWeek("M", dayKey: "tuesday"),
  DayInWeek("T", dayKey: "wednesday"),
  DayInWeek("W", dayKey: "thursday"),
  DayInWeek("TH", dayKey: "friday"),
  DayInWeek("F", dayKey: "saturday", isSelected: true),
  DayInWeek("S", dayKey: "sunday", isSelected: true),
];

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white), // Set the color of the back arrow
        backgroundColor: Color.fromARGB(255, 2, 18, 26),
      ),
      backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.1),
                child: Text(
                  'What time would you like to meditate?',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: NumberPage(),
            ),
            SizedBox(height: 40.0), // Adjust the height as needed
            Text(
              'What day would you like to meditate?',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0), // Adjust the height as needed
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SelectWeekDays(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                days:
                    _days, // Make sure to define the days variable or replace it with your own data
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    colors: [
                      const Color.fromARGB(255, 3, 24, 34),
                      const Color.fromARGB(255, 3, 24, 34),
                    ],
                    tileMode: TileMode.repeated,
                  ),
                ),
                onSelect: (values) {
                  print(values);
                },
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
                  MaterialPageRoute(builder: (context) => ThirdScreen()),
                );
              },
              child: Container(
                width: 200.0,
                height: 50.0,
                child: Center(
                  child: Text(
                    'SAVE',
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
            SizedBox(height: 35.0),
          ],
        ),
      ),
    );
  }
}
