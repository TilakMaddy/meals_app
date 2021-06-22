import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(routeArgs['id']!);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx) {
          return Text(categoryMeals[idx].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
