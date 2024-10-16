import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'final_screen.dart';
import 'package:vibration/vibration.dart';

//import 'package:flutter/services.dart';
//import 'dart:async';

class AudioScreen extends StatefulWidget {
  const AudioScreen({required this.name, required this.assetPath});

  final String name;
  final String assetPath;

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

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
            player.stop();
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 3, 24, 34),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.name}',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      } else {
                        player.play(AssetSource('${widget.assetPath}'));
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                    icon: const Icon(Icons.stop),
                    onPressed: () {
                      player.stop();
                    },
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     player.play(AssetSource('theme_01.mp3'));
            //   },
            //   child: const Text('Play Audio'),
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       player.stop();
            //     },
            //     child: const Text('Stop Audio')),
            // ElevatedButton(
            //     onPressed: () {
            //       player.pause();
            //     },
            //     child: const Text('Pause ')),
            // ElevatedButton(
            //     onPressed: () {
            //       player.resume();
            //     },
            //     child: const Text('Resume')),
            SizedBox(height: 50.0),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) {
                final position = Duration(seconds: value.toInt());
                player.seek(position);
                player.resume();
              },
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position.inSeconds),
                      style: TextStyle(color: Colors.white)),
                  Text(formatTime((duration - position).inSeconds),
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 90.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press, e.g., navigate to the next screen
                // You can use Navigator.push() to navigate to the next screen
                // Navigate to the second screen

                // HapticFeedback.heavyImpact();
                Vibration.vibrate(pattern: [100, 300, 300, 500]);

                player.stop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinalScreen()),
                );
              },
              child: Container(
                width: 80.0, // Adjust the width as needed
                height: 80.0, // Adjust the height as needed
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 60.0, // Adjust the size as needed
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 192, 136, 202), //B399CD
                shape: CircleBorder(), // Make it a circle
              ),
            ),
          ],
        ),
      ),
    );
  }
}
