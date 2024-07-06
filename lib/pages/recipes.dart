import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Container(
        child: Text(
          "Recipes",
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}
