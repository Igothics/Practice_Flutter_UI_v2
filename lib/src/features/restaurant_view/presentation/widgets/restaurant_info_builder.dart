import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/rating_stars.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';

class RestaurantInfoBuilder extends StatelessWidget {
  const RestaurantInfoBuilder(this.restaurant, {super.key,});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              restaurant.name,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${restaurant.distance} miles away',
              style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant,),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        RatingStars(rating: restaurant.rating,),
        const SizedBox(height: 8.0,),
        Text(
          restaurant.address,
          style: TextStyle(color: colorScheme.onSurfaceVariant,),
        ),
      ],
    );
  }
}
