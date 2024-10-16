import 'package:daily_meditation/bluetooth_screen.dart';
import 'package:daily_meditation/fourth_screen.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'second_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
//int counter = 5; // Initial value of the variable

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

//int counter = 5; // Initial value of the variable

class _ThirdScreenState extends State<ThirdScreen> {
  int _selectedIndex = 1; // Declare _selectedIndex here
  int counter = 0; // Initial value of the variable

  bool button1Selected = false;
  bool button2Selected = false;
  bool button3Selected = false;
  bool button4Selected = false;
  bool button5Selected = false;

  void initState() {
    super.initState();
    // Load the saved counter value when the screen is initialized
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    print('Saving counter: $counter');
    prefs.setInt('counter', counter);
    print('Counter saved successfully.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white), // Set the color of the back arrow
        backgroundColor: const Color.fromARGB(255, 3, 24, 34),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Text('$counter',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
                SizedBox(width: 8.0),
                Icon(
                  Icons.emoji_events,
                  size: 30.0,
                  color: Color.fromARGB(255, 192, 136, 202),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(
              bottom: 100.0), // Adjust the top padding as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'How are you feeling?', // Add your descriptive text here
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 20.0),
              Row(
                // First row of buttons
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    selected: button1Selected,
                    onPressed: () {
                      setState(() {
                        button1Selected = !button1Selected;
                      });
                    },
                    buttonText: 'Happy',
                  ),
                  SizedBox(width: 8),
                  CustomButton(
                    selected: button2Selected,
                    onPressed: () {
                      setState(() {
                        button2Selected = !button2Selected;
                      });
                    },
                    buttonText: 'Sad',
                  ),
                ],
              ),

              SizedBox(height: 25),

              // Second row of buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    selected: button3Selected,
                    onPressed: () {
                      setState(() {
                        button3Selected = !button3Selected;
                      });
                    },
                    buttonText: 'Anxious',
                  ),
                  SizedBox(width: 8),
                  CustomButton(
                    selected: button4Selected,
                    onPressed: () {
                      setState(() {
                        button4Selected = !button4Selected;
                      });
                    },
                    buttonText: 'Angry',
                  ),
                ],
              ),
              SizedBox(height: 25),

              // Third row with a single button
              CustomButton(
                selected: button5Selected,
                onPressed: () {
                  setState(() {
                    button5Selected = !button5Selected;
                  });
                },
                buttonText: 'Scared',
              ),
              SizedBox(height: 150.0),
              ElevatedButton(
                onPressed: () {
                  // Handle button press, e.g., navigate to the next screen
                  // You can use Navigator.push() to navigate to the next screen
                  // Navigate to the second screen
                  setState(() {
                    counter++;
                  });
                  _saveCounter(); // Save the updated counter value
                  List<String> selectedFeelings = [];

                  if (button1Selected) selectedFeelings.add('Happy');
                  if (button2Selected) selectedFeelings.add('Sad');
                  if (button3Selected) selectedFeelings.add('Anxious');
                  if (button4Selected) selectedFeelings.add('Angry');
                  if (button5Selected) selectedFeelings.add('Scared');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FourthScreen(
                        selectedFeelings: selectedFeelings,
                        counter: counter,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200.0,
                  height: 50.0,
                  child: Center(
                    child: Text(
                      'START COURSE',
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
      ),

      // Example of using _selectedIndex in the bottom navigation bar
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCustomIconButton(
            icon: Icons.home,
            label: 'Home',
            index: 0,
          ),
          _buildCustomIconButton(
            icon: Icons.do_not_disturb,
            label: 'Do Not Disturb',
            index: 1,
          ),
          _buildCustomIconButton(
            icon: Icons.person,
            label: 'You',
            index: 2,
          ),
          _buildCustomIconButton(
            icon: Icons.settings,
            label: 'Settings',
            index: 3,
          ),
        ],
      ),
    );
  }

  // Extracted method to build custom icon button
  Widget _buildCustomIconButton({
    required IconData icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        switch (_selectedIndex) {
          case 0:
            // Navigate to the main screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
            break;

          case 2:
            // Navigate to the main screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BluetoothScreen(counter: counter)),
            );
            break;
          // ... handle other cases if needed
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? Color.fromARGB(255, 192, 136, 202)
                : Colors.grey,
          ),
          SizedBox(height: 1.0),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index
                  ? Color.fromARGB(255, 192, 136, 202)
                  : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final bool selected;
  final VoidCallback onPressed;
  final String buttonText;

  CustomButton({
    required this.selected,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          primary: selected
              ? Color.fromARGB(255, 109, 60, 117)
              : Color.fromARGB(255, 192, 136, 202),
        ),
        child: Text(buttonText,
            style: TextStyle(fontSize: 16, color: Colors.white)));
  }
}

// Function to navigate to the selected screen

