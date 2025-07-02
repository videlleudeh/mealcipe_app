import 'package:flutter/material.dart';
import 'package:mealcipe_app/model/meals.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({
    super.key,
    required this.meal,
    required this.onAddFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onAddFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onAddFavorite(meal);
            },
            icon: Icon(Icons.star_border),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0),
          image: DecorationImage(
            opacity: 0.5,
            fit: BoxFit.cover,
            image: NetworkImage(meal.imageUrl),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ...meal.ingredients.map(
                (meals) => Text(
                  "- $meals",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Steps",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ...meal.steps.map(
                (meals) => Text(
                  "- $meals",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
