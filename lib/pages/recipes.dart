import 'package:flutter/material.dart';
import 'package:recipp/components/recipe_card.dart';
import 'package:recipp/pages/detailed_recipe.dart';
import 'package:recipp/models/recipe.dart';
import 'package:recipp/services/recipe_service.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final RecipeService _recipeService = RecipeService();
  late List<Recipe> _recipes;
  List<Recipe> _filteredRecipes = [];
  bool _isLoading = true;
  String _selectedCategory = 'All';
  List<String> _selectedAllergies = [];
  List<String> _selectedDiets = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    await _recipeService.loadRecipes();
    setState(() {
      _recipes = _recipeService.getAllRecipes();
      _filteredRecipes = _recipes;
      _isLoading = false;
    });
  }

  void _navigateToRecipeDetail(BuildContext context, Recipe recipe) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(
          title: recipe.title,
          description: recipe.description,
          imagePath: recipe.imagePath,
          steps: recipe.steps,
        ),
      ),
    );
  }

  void _searchRecipes(String query) {
    setState(() {
      _filteredRecipes = _recipes
          .where((recipe) =>
              (recipe.title.toLowerCase().contains(query.toLowerCase())) &&
              (_selectedCategory == 'All' ||
                  recipe.category == _selectedCategory) &&
              (_selectedAllergies.isEmpty ||
                  _selectedAllergies.every(
                      (allergy) => !recipe.allergies.contains(allergy))) &&
              (_selectedDiets.isEmpty ||
                  _selectedDiets.every((diet) => recipe.diets.contains(diet))))
          .toList();
    });
  }

  void _applyFilters() {
    setState(() {
      _filteredRecipes = _recipes.where((recipe) {
        final matchesCategory =
            _selectedCategory == 'All' || recipe.category == _selectedCategory;
        final matchesAllergies = _selectedAllergies.isEmpty ||
            _selectedAllergies
                .every((allergy) => !recipe.allergies.contains(allergy));
        final matchesDiets = _selectedDiets.isEmpty ||
            _selectedDiets.every((diet) => recipe.diets.contains(diet));
        return matchesCategory && matchesAllergies && matchesDiets;
      }).toList();
    });
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(children: [
                    Icon(
                      Icons.tune_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(width: 6.0),
                    Text("Preferences",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface)),
                  ]),
                  const SizedBox(height: 20.0),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      DropdownButton<String>(
                        value: _selectedCategory,
                        items:
                            ['All', 'Italian', 'Indian', 'American', 'Chinese']
                                .map((category) => DropdownMenuItem(
                                      value: category,
                                      child: Text(category),
                                    ))
                                .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Eggs'),
                        selected: _selectedAllergies.contains('Eggs'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Eggs')
                                : _selectedAllergies.remove('Eggs');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Dairy'),
                        selected: _selectedAllergies.contains('Dairy'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Dairy')
                                : _selectedAllergies.remove('Dairy');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Gluten'),
                        selected: _selectedAllergies.contains('Gluten'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Gluten')
                                : _selectedAllergies.remove('Gluten');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Peanuts'),
                        selected: _selectedAllergies.contains('Peanuts'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Peanuts')
                                : _selectedAllergies.remove('Peanuts');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Shellfish'),
                        selected: _selectedAllergies.contains('Shellfish'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Shellfish')
                                : _selectedAllergies.remove('Shellfish');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Soy'),
                        selected: _selectedAllergies.contains('Soy'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Soy')
                                : _selectedAllergies.remove('Soy');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Tree Nuts'),
                        selected: _selectedAllergies.contains('Tree Nuts'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Tree Nuts')
                                : _selectedAllergies.remove('Tree Nuts');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Wheat'),
                        selected: _selectedAllergies.contains('Wheat'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedAllergies.add('Wheat')
                                : _selectedAllergies.remove('Wheat');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Vegetarian'),
                        selected: _selectedDiets.contains('Vegetarian'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedDiets.add('Vegetarian')
                                : _selectedDiets.remove('Vegetarian');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Vegan'),
                        selected: _selectedDiets.contains('Vegan'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedDiets.add('Vegan')
                                : _selectedDiets.remove('Vegan');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Gluten-Free'),
                        selected: _selectedDiets.contains('Gluten-Free'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedDiets.add('Gluten-Free')
                                : _selectedDiets.remove('Gluten-Free');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Keto'),
                        selected: _selectedDiets.contains('Keto'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedDiets.add('Keto')
                                : _selectedDiets.remove('Keto');
                          });
                          _applyFilters();
                        },
                      ),
                      FilterChip(
                        label: Text('Paleo'),
                        selected: _selectedDiets.contains('Paleo'),
                        onSelected: (selected) {
                          setState(() {
                            selected
                                ? _selectedDiets.add('Paleo')
                                : _selectedDiets.remove('Paleo');
                          });
                          _applyFilters();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Recipes",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterSheet(context),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _searchController,
              onChanged: _searchRecipes,
              decoration: InputDecoration(
                hintText: 'Search recipes...',
                hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: _filteredRecipes.length,
                      itemBuilder: (context, index) {
                        final recipe = _filteredRecipes[index];
                        return RecipeCard(
                          title: recipe.title,
                          description: recipe.description,
                          imagePath: recipe.imagePath,
                          prepTime: recipe.prepTime,
                          servingSize: recipe.servingSize,
                          category: recipe.category,
                          onTap: () => _navigateToRecipeDetail(context, recipe),
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
