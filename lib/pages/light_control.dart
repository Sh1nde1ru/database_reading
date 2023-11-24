import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class LightControl extends StatefulWidget {
  const LightControl({super.key});

  @override
  State<LightControl> createState() => _LightControlState();
}

class _LightControlState extends State<LightControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 120,
                color: Colors.grey.shade400,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildLoopingListDelegate(
                      children: List<Widget>.generate(
                          24,
                          (index) => Text(
                                '$index',
                                style: TextStyle(fontSize: 40),
                              ))),
                  onSelectedItemChanged: (value) => playSound(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade400,
                height: 120,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 60,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: const FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildLoopingListDelegate(
                      children: List<Widget>.generate(
                          60,
                          (index) =>
                              Text('$index', style: TextStyle(fontSize: 40)))),
                  onSelectedItemChanged: (value) => playSound(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void playSound() async {
    AudioPlayer().play(AssetSource('sounds/click_sound.wav'));
  }
}
