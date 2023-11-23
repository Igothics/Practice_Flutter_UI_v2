import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/add_to_cart_button.dart';
import 'package:practice_food_delivery/src/common_widgets/image_info_card.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/domain/food.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';

class FoodCard extends StatelessWidget{
  const FoodCard({
    super.key,
    required this.groupKey,
    required this.food,
    required this.restaurant,
  });//use inner gap , don't use margin here.
  final String groupKey;
  final Food food;
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    final imageUrl = food.imageUrl;
    final foodName = food.name;
    final price = food.price;

    return ImageInfoCard(
      cardKey: groupKey,
      imageUrl: imageUrl,
      useGradient: true,
      gradientStops: const [0.0, 0.5],
      imageFlex: null,
      infoFlex: null,
      infoMainAxisAlignment: MainAxisAlignment.start,
      infoPadding: const EdgeInsets.all(8.0),
      titles: [Text(foodName.toCapitalize(),),],
      subtitles: [Text('\$$price',),],
      trailing: AddToCartButton.fromFoodAndRestaurant(food, restaurant),
    );
  }
}
