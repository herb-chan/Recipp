import 'package:flutter/material.dart';
import 'package:recipp/pages/home.dart';
import 'package:recipp/pages/start.dart';
import 'package:recipp/pages/recipes.dart';
import 'package:recipp/pages/favorites.dart';
import 'package:recipp/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),
        routes: {
          '/home': (context) => HomePage(),
          '/recipes': (context) => RecipesPage(),
          '/favorites': (context) => FavoritesPage(),
          '/profile': (context) => ProfilePage()
        });
  }
}
