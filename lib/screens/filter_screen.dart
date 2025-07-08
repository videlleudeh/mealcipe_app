import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.setFilter});

  final Map<Filter, bool> setFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFilter = false;
  var _veganFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.setFilter[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.setFilter[Filter.lactoseFree]!;
    _vegetarianFilter = widget.setFilter[Filter.vegetarian]!;
    _veganFilter = widget.setFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter Your Meal",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;

          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isExisting) {
                setState(() {
                  _glutenFreeFilter = isExisting;
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                "Your gluten-free food",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isExisting) {
                setState(() {
                  _lactoseFreeFilter = isExisting;
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                "Your lactose-free food",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _vegetarianFilter,
              onChanged: (isExisting) {
                setState(() {
                  _vegetarianFilter = isExisting;
                });
              },
              title: Text(
                "Vegeterian",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                "Your vegetarian food",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
            SwitchListTile(
              value: _veganFilter,
              onChanged: (isExisting) {
                setState(() {
                  _veganFilter = isExisting;
                });
              },
              title: Text(
                "Vegan",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                "Your vegan food",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
