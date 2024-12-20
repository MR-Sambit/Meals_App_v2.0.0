import 'package:myapp/model/recipe.dart';

class MealPlanController {
  static final List<Recipe> mealPlan = [];

  static void printMealPlan() {
    for (Recipe recipe in mealPlan) {
      print('Recipe: ${recipe.title}');
    }
  }
}