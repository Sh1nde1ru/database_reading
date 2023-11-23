import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Reading extends StatefulWidget {
  const Reading({super.key});

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  var teplota;
  var vlhkost;
  var outputTemp;
  var outputHum;
  @override
  void initState() {
    super.initState();
    DatabaseReference humRef =
        FirebaseDatabase.instance.ref("outputData/humidity");
    Stream<DatabaseEvent> streamHum = humRef.onValue;
    streamHum.listen((event) {
      vlhkost = event.snapshot.value;
      setState(() {
        outputHum = vlhkost;
      });
    });

    DatabaseReference ref =
        FirebaseDatabase.instance.ref("outputData/temperature");
    Stream<DatabaseEvent> streamTemp = ref.onValue;
    streamTemp.listen((DatabaseEvent event) {
      teplota = event.snapshot.value;
      setState(() {
        outputTemp = teplota;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            margin: EdgeInsets.only(top: 20, left: 5, right: 10),
            height: 150,
            width: 150,
            color: Colors.amber,
            child: Center(
              child: Column(children: [
                Text(
                  "vlhkost:",
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  outputHum.toString() + "%",
                  style: TextStyle(fontSize: 50),
                )
              ]),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              margin: EdgeInsets.only(top: 20, left: 5, right: 10),
              height: 150,
              width: 150,
              color: Colors.amber,
              child: Center(
                child: Column(children: [
                  Text(
                    "teplota:",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(
                    outputTemp.toString() + "°C",
                    style: TextStyle(fontSize: 50),
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
