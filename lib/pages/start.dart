import 'package:flutter/material.dart';
import 'package:recipp/pages/favorites.dart';
import 'package:recipp/pages/home.dart';
import 'package:recipp/pages/profile.dart';
import 'package:recipp/pages/recipes.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _selected_index = 0;

  final List<Widget> _pages = [
    HomePage(),
    RecipesPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void _navigate_bottom_bar(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selected_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        onTap: _navigate_bottom_bar,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[400],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Recipes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
