import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 10, // Placeholder for number of favorite recipes
          itemBuilder: (context, index) {
            return Card(
              color: Theme.of(context).colorScheme.secondary,
              child: ListTile(
                title: Text(
                  'Favorite Recipe Title',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                subtitle: Text(
                  'Short description of the favorite recipe.',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.error),
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
