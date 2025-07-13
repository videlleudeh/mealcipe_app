import 'package:flutter/material.dart';

import 'package:mealcipe_app/model/meals.dart';
import 'package:mealcipe_app/screens/meal_detail_sceen.dart';
import 'package:mealcipe_app/widgets/meal_item.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _onSelectMeal(BuildContext context, Meal meal) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (cntxt) => MealDetail(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (cntxt, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) {
          _onSelectMeal(context, meal);
        },
      ),
    );

    if (meals.isEmpty) {
      bodyContent = Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Oops... Nothing to see here",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    if (title == null) {
      return bodyContent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: bodyContent,
    );
  }
}
