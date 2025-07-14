import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealcipe_app/screens/category_screen.dart';
import 'package:mealcipe_app/screens/filter_screen.dart';
import 'package:mealcipe_app/screens/meals_screen.dart';
import 'package:mealcipe_app/widgets/drawer.dart';
import 'package:mealcipe_app/providers/favorite_provider.dart';
import 'package:mealcipe_app/providers/filters_provider.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int pageIndex = 0;

  void _selectedScreen(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void _selectedListTile(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filter") {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: ((cntxt) => const FilterScreen())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealProvider);

    Widget activeScreen = CategoryPage(availableMeals: availableMeals);
    var pageTitle = "Categories";

    if (pageIndex == 1) {
      final favoriteMeal = ref.watch(favoriteProvider);
      activeScreen = MealsPage(meals: favoriteMeal);
      pageTitle = " Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: CustomDrawer(onSelectListTile: _selectedListTile),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
