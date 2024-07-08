import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: Container(
        child: Text(
          "Favourites",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ),
      )),
    );
  }
}
