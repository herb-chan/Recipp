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
    final recipes = [
      {
        'title': 'Spaghetti Carbonara',
        'description':
            'A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.',
        'imagePath': 'assets/placeholder_meals/spaghetti_carbonara.jpg',
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
        'steps': [
          'Cook the pasta.',
          'Prepare the Alfredo sauce.',
          'Grill the chicken.',
          'Mix all together.'
        ],
      },
      {
        'title': 'Beef Tacos',
        'description': 'Spicy beef tacos with fresh toppings.',
        'imagePath': 'assets/beef_tacos.jpg',
        'steps': [
          'Cook the beef with spices.',
          'Prepare the toppings.',
          'Assemble the tacos.',
          'Serve with lime wedges.'
        ],
      },
      {
        'title': 'Caesar Salad',
        'description': 'Classic Caesar salad with homemade dressing.',
        'imagePath': 'assets/caesar_salad.jpg',
        'steps': [
          'Prepare the lettuce.',
          'Make the Caesar dressing.',
          'Toss the salad with dressing.',
          'Add croutons and Parmesan.'
        ],
      },
      {
        'title': 'Margherita Pizza',
        'description':
            'Traditional Italian pizza with tomato, mozzarella, and basil.',
        'imagePath': 'assets/margherita_pizza.jpg',
        'steps': [
          'Prepare the dough.',
          'Spread tomato sauce.',
          'Add mozzarella and basil.',
          'Bake in the oven.'
        ],
      },
      {
        'title': 'Pad Thai',
        'description':
            'A popular Thai noodle dish with shrimp, tofu, and peanuts.',
        'imagePath': 'assets/pad_thai.jpg',
        'steps': [
          'Cook the noodles.',
          'Stir-fry shrimp and tofu.',
          'Add noodles and sauce.',
          'Garnish with peanuts and lime.'
        ],
      },
      {
        'title': 'Veggie Stir-Fry',
        'description': 'Colorful stir-fried vegetables with a savory sauce.',
        'imagePath': 'assets/veggie_stir_fry.jpg',
        'steps': [
          'Chop the vegetables.',
          'Stir-fry the veggies.',
          'Add the sauce.',
          'Serve with rice.'
        ],
      },
      {
        'title': 'Beef Stroganoff',
        'description': 'Creamy beef stroganoff served over egg noodles.',
        'imagePath': 'assets/beef_stroganoff.jpg',
        'steps': [
          'Cook the beef.',
          'Prepare the sauce.',
          'Mix with cooked noodles.',
          'Garnish with parsley.'
        ],
      },
      {
        'title': 'Greek Salad',
        'description':
            'Fresh salad with tomatoes, cucumbers, olives, and feta cheese.',
        'imagePath': 'assets/greek_salad.jpg',
        'steps': [
          'Chop the vegetables.',
          'Mix in a bowl.',
          'Add feta cheese.',
          'Drizzle with olive oil and vinegar.'
        ],
      },
      {
        'title': 'Chocolate Brownies',
        'description': 'Rich and fudgy chocolate brownies.',
        'imagePath': 'assets/chocolate_brownies.jpg',
        'steps': [
          'Prepare the batter.',
          'Pour into a baking pan.',
          'Bake in the oven.',
          'Let cool before cutting.'
        ],
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard(
                    title: recipe['title'] as String,
                    description: recipe['description'] as String,
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
