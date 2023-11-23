import 'package:database_reading/util/hour.dart';
import 'package:database_reading/util/minutes.dart';
import 'package:flutter/material.dart';

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
                height: 100,
                color: Colors.grey.shade400,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return MyHours(hours: index);
                      }),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey.shade400,
                height: 100,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  perspective: 0.005,
                  diameterRatio: 1.2,
                  physics: FixedExtentScrollPhysics(),
                  childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return MyMinutes(mins: index);
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
