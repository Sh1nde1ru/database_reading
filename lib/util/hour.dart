// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyHours extends StatelessWidget {
  int hours;
  MyHours({required this.hours});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            hours.toString(),
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
