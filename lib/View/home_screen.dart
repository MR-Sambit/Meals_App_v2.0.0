import 'package:flutter/material.dart';
import '../Controller/recipe_controller.dart';
import '../model/recipe.dart';
// import '../Controller/recipe_controller.dart';

class HomeScreen extends StatelessWidget {
  final RecipeController recipeController = RecipeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange[50]!, Colors.deepOrange[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          future: recipeController.fetchRecipes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading recipes'));
            } else {
              final recipes = snapshot.data as List<Recipe>;
              return GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 3 / 4.5,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/recipeDetail',
                        arguments: recipes[index],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.network(
                              recipes[index].imageUrl,
                              height: 120,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipes[index].title,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  recipes[index].cuisineType,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}