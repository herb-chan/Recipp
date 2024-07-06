import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Container(
        child: Text(
          "Favourites",
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}
