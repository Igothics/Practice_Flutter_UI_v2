import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_food_delivery/src/common_widgets/image_info_card.dart';
import 'package:practice_food_delivery/src/common_widgets/rating_stars.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.cardId,
    required this.restaurant,
    this.margin,
  });
  final String cardId;
  final Restaurant restaurant;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    final imageUrl = restaurant.imageUrl;
    final resName = restaurant.name;
    final resRating = restaurant.rating;
    final resAddress = restaurant.address;
    final resDistance = restaurant.distance;

    return ImageInfoCard(
      cardKey: cardId,
      imageHeroTag: resName,
      imageUrl: imageUrl,
      margin: margin,
      infoPadding: const EdgeInsets.all(8.0),
      onCardTapUp: (_) => context.go('/home/restaurants/$resName', extra: restaurant),
      imageFlex: 2,
      infoFlex: 3,
      titles: [
        Text(resName.toCapitalize(),),
        RatingStars(rating: resRating,),
      ],
      subtitles: [
        const SizedBox(height: 8.0,),
        Text(resAddress,),
        Text('$resDistance miles away',),
      ],
    );
  }
}
