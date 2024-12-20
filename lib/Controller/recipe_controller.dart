// // controllers/recipe_controller.dart
// import 'package:myapp/Controller/mealPlan_Controller.dart';

// import '../model/recipe.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class RecipeController {
//   Future<List<Recipe>> fetchRecipes() async {
//     final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='));
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((recipeJson) => Recipe.fromJson(recipeJson)).toList();
//     } else {
//       throw Exception('Failed to load recipes');
//     }
//   }

//   void addToMealPlan(Recipe recipe) {
//     // Example implementation: add recipe to a static list representing a meal plan
//     MealPlanController.mealPlan.add(recipe);
//   }
// }

// controllers/recipe_controller.dart
import '../model/recipe.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'mealPlan_Controller.dart';

class RecipeController {
  Future<List<Recipe>> fetchRecipes() async {
    final response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='));
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedData = json.decode(response.body);

      // Ensure the key "meals" exists in the response and is not null
      if (decodedData['meals'] != null) {
        List<dynamic> mealsData = decodedData['meals'];
        return mealsData.map((mealJson) => Recipe.fromJson(mealJson)).toList();
      } else {
        throw Exception('No recipes found');
      }
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  void addToMealPlan(Recipe recipe) {
    MealPlanController.mealPlan.add(recipe);
  }
}
