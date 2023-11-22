import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Reading extends StatefulWidget {
  const Reading({super.key});

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  var teplota;
  var output;
  @override
  void initState() {
    super.initState();
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("outputData/humidity");
    Stream<DatabaseEvent> stream = ref.onValue;
    stream.listen((DatabaseEvent event) {
      teplota = event.snapshot.value;
      setState(() {
        output = teplota;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          height: 200,
          width: 200,
          color: Colors.amber,
          child: Center(
            child: Column(children: [
              Text(
                "vlhkost:",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                output.toString() + "%",
                style: TextStyle(fontSize: 70),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
