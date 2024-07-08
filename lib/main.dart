import 'package:flutter/material.dart';
import 'package:recipp/pages/start.dart';
import 'package:recipp/pages/home.dart';
import 'package:recipp/pages/recipes.dart';
import 'package:recipp/pages/favorites.dart';
import 'package:recipp/pages/profile.dart';
import 'package:recipp/pages/settings.dart';

import 'package:recipp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
        routes: {
          '/home': (context) => HomePage(),
          '/recipes': (context) => RecipesPage(),
          '/favorites': (context) => FavoritesPage(),
          '/profile': (context) => ProfilePage(),
          '/settings': (context) => SettingsPage(),
        });
  }
}
