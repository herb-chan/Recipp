class Recipe {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String prepTime;
  final String servingSize;
  final String category;
  final List<String> steps;
  final List<String> allergies;
  final List<String> diets;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.prepTime,
    required this.servingSize,
    required this.category,
    required this.steps,
    required this.allergies,
    required this.diets,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      prepTime: json['prepTime'],
      servingSize: json['servingSize'],
      category: json['category'],
      steps: List<String>.from(json['steps']),
      allergies: List<String>.from(json['allergies']),
      diets: List<String>.from(json['diets']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imagePath': imagePath,
      'prepTime': prepTime,
      'servingSize': servingSize,
      'category': category,
      'steps': steps,
      'allergies': allergies,
      'diets': diets,
    };
  }
}
