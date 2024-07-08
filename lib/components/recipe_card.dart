import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final double height;

  const RecipeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    this.height = 100.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
