import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(routeArgs['id']!))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return MealItem(
            affordability: categoryMeals[idx].affordability,
            complexity: categoryMeals[idx].complexity,
            duration: categoryMeals[idx].duration,
            imageUrl: categoryMeals[idx].imageUrl,
            title: categoryMeals[idx].title,
            id: categoryMeals[idx].id,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
