// recipe_service.dart

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:recipp/models/recipe.dart';

class RecipeService {
  List<Recipe> _recipes = [];

  Future<void> loadRecipes() async {
    try {
      String data = await rootBundle.loadString('assets/data/recipes.json');
      List<dynamic> jsonList = json.decode(data);
      _recipes = jsonList.map((json) => Recipe.fromJson(json)).toList();
    } catch (e) {
      print('Error loading recipes: $e');
    }
  }

  List<Recipe> getAllRecipes() {
    return List<Recipe>.from(_recipes);
  }

  List<Recipe> searchRecipes(String query) {
    query = query.toLowerCase();
    return _recipes
        .where((recipe) => recipe.title.toLowerCase().contains(query))
        .toList();
  }
}
