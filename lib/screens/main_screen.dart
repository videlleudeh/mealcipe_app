import 'package:flutter/material.dart';

import 'package:mealcipe_app/model/meals.dart';
import 'package:mealcipe_app/screens/category_screen.dart';
import 'package:mealcipe_app/screens/filter_screen.dart';
import 'package:mealcipe_app/screens/meals_screen.dart';
import 'package:mealcipe_app/widgets/drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  final List<Meal> _favoriteMeal = [];

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
        MaterialPageRoute(builder: ((cntxt) => FilterScreen())),
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoryPage(onAddFavorite: _addFavorite);
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
