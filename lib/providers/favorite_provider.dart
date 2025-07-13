import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealcipe_app/model/meals.dart';

class FavoriteNotifier extends StateNotifier<List<Meal>> {
  FavoriteNotifier() : super([]);

  bool onClickFavorite(Meal meal) {
    final isFavorite = state.contains(meal);

    if (isFavorite) {
      // the .where method returns true or false so if the item it is looking at doesnt have the same id with the meal in the list it returns true and adds is to the list.
      state = state.where((item) => item.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Meal>>((
  ref,
) {
  return FavoriteNotifier();
});
