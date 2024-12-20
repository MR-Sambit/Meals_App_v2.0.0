import 'package:flutter/material.dart';
import '../model/recipe.dart';
import '../Controller/recipe_controller.dart';

class RecipeDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context)!.settings.arguments as Recipe;
    final RecipeController recipeController = RecipeController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          recipe.title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade700,
        elevation: 4,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe Image with Shadow Effect
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    recipe.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Recipe Title
              Text(
                recipe.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade700,
                ),
              ),
              SizedBox(height: 10),
              // Recipe Description
              Text(
                recipe.description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 20),
              // Ingredients Section
              Divider(thickness: 1.5),
              Text(
                'Ingredients',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: recipe.ingredients.map(
                  (ingredient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.kitchen, color: Colors.orange.shade700, size: 20),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            ingredient,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).toList(),
              ),
              SizedBox(height: 20),
              // Steps Section
              Divider(thickness: 1.5),
              Text(
                'Steps',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                recipe.steps,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade800,
                  height: 1.8,
                ),
              ),
              SizedBox(height: 30),
              // Add to Meal Plan Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {
                    recipeController.addToMealPlan(recipe);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${recipe.title} added to meal plan!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text(
                    'Add to Meal Plan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
