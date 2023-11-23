import 'package:database_reading/models/order_model.dart';
import 'package:database_reading/pages/color_picker.dart';
import 'package:database_reading/pages/light_control.dart';
import 'package:database_reading/pages/ssid_setup.dart';
import 'package:flutter/material.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Reading(),
    SsidSetup(),
    ColorWheel(),
    LightControl(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Color',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: 'Light control',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
      ),
    );
  }
}
