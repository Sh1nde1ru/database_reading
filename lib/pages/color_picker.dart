import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

class ColorWheel extends StatefulWidget {
  const ColorWheel({super.key});

  @override
  State<ColorWheel> createState() => _ColorWheelState();
}

class _ColorWheelState extends State<ColorWheel> {
  Color _currentColor = Colors.blue;
  final _controller = CircleColorPickerController(initialColor: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Wheel'),
        backgroundColor: _currentColor,
      ),
      body: Center(
        child: CircleColorPicker(
          controller: _controller,
          onChanged: (color) {
            setState(() {
              _currentColor = color;
            });
          },
        ),
      ),
    );
  }
}
