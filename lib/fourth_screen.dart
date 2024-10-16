import 'package:flutter/material.dart';
import 'fifth_screen.dart';

class FourthScreen extends StatefulWidget {
  final List<String> selectedFeelings;
  final int counter;

  FourthScreen({required this.selectedFeelings, required this.counter});

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class Sound {
  final String name;
  final String assetPath;

  Sound({
    required this.name,
    required this.assetPath,
  });
}

class _FourthScreenState extends State<FourthScreen> {
  final List<Sound> sounds = [
    Sound(name: 'Relaxing Audio', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Focus Attention', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(
        name: 'Body Scan',
        assetPath:
            'peaceful-garden-healing-light-piano-for-meditation-zen-landscapes-112199.mp3'),
    // Add more sounds as needed
    Sound(name: 'Sound 4', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 5', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 6', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 7', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 8', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 9', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 10', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 11', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 12', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 13', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 14', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 15', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 16', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 17', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 18', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 19', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 20', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 21', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 22', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 23', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 24', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 25', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 26', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 27', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 28', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 29', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 30', assetPath: 'relaxing-145038.mp3'),
    Sound(name: 'Sound 31', assetPath: 'please-calm-my-mind-125566.mp3'),
    Sound(name: 'Sound 32', assetPath: 'relaxing-145038.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white), // Set the color of the back arrow
        backgroundColor: const Color.fromARGB(255, 3, 24, 34),
        title: Text(
          'Comforting Course',
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true, // Center the title in the app bar
      ),
      backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 350.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Feeling',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              SizedBox(height: 10.0),
              Text(
                widget.selectedFeelings
                    .join(', '), // Use ', ' to separate feelings
                textAlign: TextAlign.center, // Center-align the text
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 40.0), // Add some space between the texts
              Text(
                'Feel better with a \nmeditation style\nof your liking!',
                textAlign: TextAlign.center, // Center-align the text
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 120.0), // Add some space between the texts
              Text(
                'Pick a narrator & Meditation style',
                textAlign: TextAlign.center, // Center-align the text
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 360.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(
                          255, 192, 136, 202)), // Set border color
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // Set border radius
                ),
                child: ScrollbarTheme(
                  data: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(Colors.white),
                    trackColor: MaterialStateProperty.all(Colors.transparent),
                    // Adjust other properties as needed
                  ),
                  child: ListView.builder(
                    itemCount: sounds.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              sounds[index].name,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Handle sound tap
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AudioScreen(
                                    name: sounds[index].name,
                                    assetPath: sounds[index].assetPath,
                                  ),
                                ),
                              );
                            },
                          ),
                          Divider(
                            color: Color.fromARGB(
                                255, 192, 136, 202), // Set the divider color
                            thickness: 1.0, // Set the thickness of the divider
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
