import 'package:flutter/material.dart';
import 'package:recipp/components/recipe_card.dart';
import 'package:recipp/pages/detailed_recipe.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  void _navigateToRecipeDetail(BuildContext context, String title,
      String description, String imagePath, List<String> steps) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(
          title: title,
          description: description,
          imagePath: imagePath,
          steps: steps,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const recipes = [
      {
        'title': 'Spaghetti Carbonara',
        'description':
            'A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.',
        'imagePath': 'assets/spaghetti_carbonara.jpg',
        'prepTime': '20 mins',
        'servingSize': '2 servings',
        'category': 'Italian',
        'steps': [
          'Boil the pasta.',
          'Cook the pancetta.',
          'Mix eggs and cheese.',
          'Combine pasta with pancetta and egg mixture.'
        ],
      },
      {
        'title': 'Chicken Alfredo',
        'description':
            'Creamy Alfredo sauce with grilled chicken over fettuccine pasta.',
        'imagePath': 'assets/chicken_alfredo.jpg',
        'prepTime': '30 mins',
        'servingSize': '4 servings',
        'category': 'Italian',
        'steps': [
          'Cook the pasta.',
          'Prepare the Alfredo sauce.',
          'Grill the chicken.',
          'Mix all together.'
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(
                    title: recipe['title'] as String,
                    description: recipe['description'] as String,
                    imagePath: recipe['imagePath'] as String,
                    prepTime: recipe['prepTime'] as String,
                    servingSize: recipe['servingSize'] as String,
                    category: recipe['category'] as String,
                    onTap: () => _navigateToRecipeDetail(
                      context,
                      recipe['title'] as String,
                      recipe['description'] as String,
                      recipe['imagePath'] as String,
                      recipe['steps'] as List<String>,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
