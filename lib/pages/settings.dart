import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Container(
        child: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}
