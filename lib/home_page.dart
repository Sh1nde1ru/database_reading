import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({super.key});

  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("text")));
  }
/*
  void retrieveOutputData() {
    dbRef.child("outputData").onChildChanged.listen((data) {
      OutputData outputData = OutputData.fromJson(data.snapshot.value as Map);
      Output output = Output(key: data.snapshot.key, outputData: outputData);
      outputList.add(output);
      setState(() {});
    });
  }

  Widget outputWidget(Output outputList) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Container(
          width: 200,
          height: 200,
          child: Text(outputList.outputData!.humidity!),
        ),
        Container(
          width: 200,
          height: 200,
          child: Text(outputList.outputData!.temperature!),
        )
      ]),
    );
  }*/
}
