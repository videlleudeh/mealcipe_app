import 'package:flutter/material.dart';
import 'package:mealcipe_app/data/dummy_data.dart';
import 'package:mealcipe_app/model/category.dart';
import 'package:mealcipe_app/model/meals.dart';
import 'package:mealcipe_app/screens/meals_screen.dart';
import 'package:mealcipe_app/widgets/category_item.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final categoryList = availableMeals
        .where((meals) => meals.categories.contains(category.id))
        .toList();

    // Another method- Navigator.push(context, MaterialPageRoute(builder: (cntxt) => MealsPage(title: "Food Cantent", meals: []),),);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cntxt) =>
            MealsPage(title: category.title, meals: categoryList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.only(left: 20, right: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        // categoryData
        //     .map((category) => CategoryItem(category: category))
        //     .toList(),
        for (final category in categoryData)
          CategoryItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          ),
      ],
    );
  }
}
