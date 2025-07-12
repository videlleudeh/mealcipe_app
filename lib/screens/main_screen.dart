import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealcipe_app/model/meals.dart';
import 'package:mealcipe_app/screens/category_screen.dart';
import 'package:mealcipe_app/screens/filter_screen.dart';
import 'package:mealcipe_app/screens/meals_screen.dart';
import 'package:mealcipe_app/widgets/drawer.dart';
import 'package:mealcipe_app/providers/meals_provider.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int pageIndex = 0;
  final List<Meal> _favoriteMeal = [];
  Map<Filter, bool> _selectedFilter = kInitialFilter;

  void _selectedScreen(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void _addFavorite(Meal meal) {
    final isExisting = _favoriteMeal.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
    }
  }

  void _selectedListTile(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filter") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: ((cntxt) => FilterScreen(setFilter: _selectedFilter)),
        ),
      );
      setState(() {
        _selectedFilter = result ?? kInitialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealProvider);
    final List<Meal> availableMeals = meals.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activeScreen = CategoryPage(
      onAddFavorite: _addFavorite,
      availableMeals: availableMeals,
    );
    var pageTitle = "Categories";

    if (pageIndex == 1) {
      activeScreen = MealsPage(
        meals: _favoriteMeal,
        onAddFavorite: _addFavorite,
      );
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
