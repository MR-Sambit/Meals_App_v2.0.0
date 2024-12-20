// models/meal_plan.dart
import 'package:myapp/model/recipe.dart';

class MealPlan {
  final DateTime date;
  final List<Recipe> recipes;

  MealPlan({required this.date, required this.recipes});
}