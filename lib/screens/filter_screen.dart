import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mealcipe_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter Your Meal",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.glutenFree]!,
            onChanged: (isFiltered) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, isFiltered);
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
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (isFiltered) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isFiltered);
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
            value: activeFilter[Filter.vegetarian]!,
            onChanged: (isFiltered) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, isFiltered);
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
            value: activeFilter[Filter.vegan]!,
            onChanged: (isFiltered) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isFiltered);
            },
            title: Text("Vegan", style: Theme.of(context).textTheme.titleLarge),
            subtitle: Text(
              "Your vegan food",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
