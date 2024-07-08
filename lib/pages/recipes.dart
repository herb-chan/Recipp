import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: Container(
        child: Text(
          "Recipes",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
      )),
    );
  }
}
