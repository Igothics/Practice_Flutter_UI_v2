import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_food_delivery/src/common_widgets/image_info_card.dart';
import 'package:practice_food_delivery/src/common_widgets/rating_stars.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';

class FavoritedRestaurantCard extends StatelessWidget {
  const FavoritedRestaurantCard({
    super.key,
    required this.groupKey,
    required this.restaurant,
    this.margin,
  });
  final String groupKey;
  final Restaurant restaurant;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    final imageUrl = restaurant.imageUrl;
    final resName = restaurant.name;
    final resRating = restaurant.rating;

    return ImageInfoCard(
      cardKey: groupKey,
      useGradient: true,
      imageHeroTag: resName,
      imageUrl: imageUrl,
      margin: margin,
      infoPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      onCardTapUp: (_) => context.go('/home/restaurants/$resName', extra: restaurant),
      imageFlex: null,
      infoFlex: null,
      titles: [
        Text(resName.toCapitalize(),),
        RatingStars(rating: resRating,),
      ],
      trailingAlignment: Alignment.centerRight,
      trailing: const Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: Icon(Icons.favorite_rounded, color: Colors.red,),
      ),
    );
  }
}