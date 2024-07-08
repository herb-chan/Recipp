import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Placeholder for number of favorite recipes
          itemBuilder: (context, index) {
            return Card(
              color: Colors.grey[800],
              child: ListTile(
                title: Text(
                  'Favorite Recipe Title',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  'Short description of the favorite recipe.',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // Add your remove favorite functionality here
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
