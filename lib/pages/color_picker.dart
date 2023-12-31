import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class ColorWheel extends StatefulWidget {
  const ColorWheel({super.key});

  @override
  State<ColorWheel> createState() => _ColorWheelState();
}

class _ColorWheelState extends State<ColorWheel> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  Color currentColor = Colors.blue;
  final _controller = CircleColorPickerController(initialColor: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Wheel'),
        backgroundColor: currentColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleColorPicker(
              controller: _controller,
              onChanged: (color) {
                setState(() {
                  currentColor = color;
                });
              },
            ),
            OutlinedButton(onPressed: sendData, child: Text("Set Color"))
          ],
        ),
      ),
    );
  }

  void sendData() {
    Map<String, dynamic> data = {
      "color": currentColor.toString(),
    };
    ref.child("ColorLight").set(data);
  }
}
