import 'package:flutter/material.dart';

class SsidSetup extends StatefulWidget {
  const SsidSetup({super.key});

  @override
  State<SsidSetup> createState() => _SsidSetupState();
}

class _SsidSetupState extends State<SsidSetup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String name = "";
    String password = "";
    setState(() {
      name = ssid.text;
      password = pass.text;
    });
  }

  TextEditingController ssid = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: ssid,
                decoration: InputDecoration(
                    hintText: "SSID",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            ),
            TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Entered Credentials'),
                      content: Text('SSID: ' +
                          ssid.text +
                          "\n" +
                          "Password: " +
                          pass.text),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('ok'))
                      ],
                    ),
                  );
                },
                child: Text("Send"))
          ],
        ),
      ),
    );
  }
}
