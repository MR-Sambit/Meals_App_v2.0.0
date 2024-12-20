import 'package:flutter/material.dart';
import 'View/home_screen.dart';
import 'View/recipe_detail_screen.dart';

void main() {
  runApp(MealsApp());
}

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/recipeDetail': (context) => RecipeDetailScreen(),
      },
    );
  }
}