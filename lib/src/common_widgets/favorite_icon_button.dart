import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/favorites/data/user_favorites_repository_provider.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/providers/user_favorites_provider.dart';
class FavoriteIconButton extends HookConsumerWidget {
  const FavoriteIconButton({super.key, required this.restaurantId, this.size, this.color = Colors.red});
  final int restaurantId;
  final double? size;
  final Color? color;
  static const errorIcon = Icon(Icons.question_mark,);
  static const favoriteIcon = Icon(Icons.favorite,);
  static const favoriteBorderIcon = Icon(Icons.favorite_border,);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userFavoritesRepository = ref.watch(userFavoritesRepositoryProvider);
    final favorites = ref.watch(userFavoritesProvider);

    return IconButton(
      onPressed: () => userFavoritesRepository.updateFavorites(restaurantId),
      iconSize: size,
      color: color,
      icon: favorites.when(
          data: (data) => data.favorites.contains(restaurantId) ? favoriteIcon : favoriteBorderIcon,
          error: (_, __) => errorIcon,
          loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
