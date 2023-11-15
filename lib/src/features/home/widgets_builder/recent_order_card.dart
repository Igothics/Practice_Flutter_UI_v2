import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/add_to_cart_button.dart';
import 'package:practice_food_delivery/src/common_widgets/image_info_card.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class RecentOrderCard extends StatelessWidget {
  const RecentOrderCard({
    super.key,
    required this.keyGroup,
    required this.order,
    this.cardWidth,
    this.margin,
  });
  final String keyGroup;
  final Order order;
  final double? cardWidth;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final imageUrl = order.imageUrl;
    final foodName = order.foodName;
    final restaurantName = order.restaurantName;
    final orderDate = order.date != null ? formatRecordDate(order.date!) : '';

    return ImageInfoCard(
      cardId: keyGroup,
      cardWith: cardWidth,
      imageUrl: imageUrl,
      margin: margin,
      infoPadding: const EdgeInsets.all(8.0),
      titles: [
        Text(
          foodName.toCapitalize(),
          style: const TextStyle(fontWeight: FontWeight.bold,),
        ),
        Text(restaurantName,),
      ],
      subtitles: [
        const SizedBox(height: 8.0,),
        Text(orderDate,),
      ],
      trailingAlignment: Alignment.centerRight,
      trailing: AddToCartButton.fromOrder(order),
    );
  }
}
