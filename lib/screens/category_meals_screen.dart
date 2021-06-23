import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> categoryMeals;
  late String catTitle;
  var ranOnce = false;

  @override
  void initState() {
    // context wont be available here so we must resort to the didChangeDependencies
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!ranOnce) {
      final Map<String, String> routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      catTitle = routeArgs['title']!;
      categoryMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(routeArgs['id']!))
          .toList();
    }
    ranOnce = true;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
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
            removeItem: (idx) {
              setState(() {
                categoryMeals.removeWhere((e) => e.id == idx);
              });
            },
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
