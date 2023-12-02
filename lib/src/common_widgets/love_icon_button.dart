import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/love_icon.dart';
import 'package:practice_food_delivery/src/features/favorites/data/user_favorites_repository_provider.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/providers/user_favorites_provider.dart';
class LoveIconButton extends HookConsumerWidget {
  const LoveIconButton({super.key, required this.restaurantId, this.size, this.color = Colors.red});
  final int restaurantId;
  final double? size;
  final Color? color;
  static const errorIcon = Icon(Icons.question_mark,);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userFavoritesRepository = ref.watch(userFavoritesRepositoryProvider);
    final favorites = ref.watch(userFavoritesProvider);
    final favoriteIconController = useAnimationController(
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    useAnimation(favoriteIconController);

    return favorites.when(
      error: (error, _) => errorIcon,
      loading: () => const CircularProgressIndicator(),
      data: (data) {
        final isLoved = data.favorites.contains(restaurantId);
        if (isLoved) favoriteIconController.forward();

        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: (){
            if (isLoved) {
              favoriteIconController.reverse();
            } else {
              favoriteIconController.forward();
            }
            userFavoritesRepository.updateFavorites(restaurantId);
          },
          icon: LoveIcon(controller: favoriteIconController,),
        );
      },
    );
  }
}
