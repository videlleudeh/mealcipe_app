import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSelectListTile});

  final void Function(String identifier) onSelectListTile;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 100,
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.all(36),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withAlpha(150),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const Icon(Icons.fastfood, size: 50),
                  const SizedBox(height: 10),
                  Text(
                    "Your Tasty Meals",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text(
              "Meals",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 20),
            ),
            onTap: () {
              onSelectListTile("meals");
            },
          ),
          ListTile(
            leading: Icon(Icons.filter_list),
            title: Text(
              "Filter Food",
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 20),
            ),
            onTap: () {
              onSelectListTile("filter");
            },
          ),
        ],
      ),
    );
  }
}
