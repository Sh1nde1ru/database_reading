import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';

class LightControl extends StatefulWidget {
  const LightControl({super.key});

  @override
  State<LightControl> createState() => _LightControlState();
}

class _LightControlState extends State<LightControl> {
  var hour;
  var minutes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () async {
                  final result = await showBoardDateTimePicker(
                    context: context,
                    pickerType: DateTimePickerType.time,
                  );
                  if (result != null) {
                    setState(
                        () => {hour = result.hour, minutes = result.minute});
                  } else {
                    setState(() => {hour = 00, minutes = 00});
                  }
                },
                child: Text("Light on")),
            Text(BoardDateFormat('hh/mm').format(hour))
          ],
        ),
      ),
    );
  }
}
