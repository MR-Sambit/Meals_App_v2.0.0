// class Recipe {
//   final String id;
//   final String title;
//   final String description;
//   final String imageUrl;
//   final List<String> ingredients;
//   final String steps;
//   final String cuisineType;

//   Recipe({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     required this.ingredients,
//     required this.steps,
//     required this.cuisineType,
//   });

//   factory Recipe.fromJson(Map<String, dynamic> json) {
//     return Recipe(
//       id: json['id'],
//       title: json['title'],
//       description: json['description'],
//       imageUrl: json['imageUrl'],
//       ingredients: List<String>.from(json['ingredients']),
//       steps: json['steps'],
//       cuisineType: json['cuisineType'],
//     );
//   }
// }
// models/recipe.dart
class Recipe {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;
  final String steps;
  final String cuisineType;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    this.cuisineType = '',
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Collect ingredients dynamically
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    return Recipe(
      id: json['idMeal'],
      title: json['strMeal'],
      description: json['strCategory'] ?? '', // Example category as description
      imageUrl: json['strMealThumb'],
      ingredients: ingredients,
      steps: json['strInstructions'] ?? '',
    );
  }
}
