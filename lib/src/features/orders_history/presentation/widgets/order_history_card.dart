import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/add_to_cart_button.dart';
import 'package:practice_food_delivery/src/common_widgets/image_info_card.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
    required this.groupKey,
    required this.order,
    this.margin,
    this.infoPadding = const EdgeInsets.all(8.0),
  });
  final String groupKey;
  final Order order;
  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;
  @override
  Widget build(BuildContext context) {
    final imageUrl = order.imageUrl;
    final foodName = order.foodName;
    final restaurantName = order.restaurantName;
    final orderDate = order.date != null ? formatRecordDate(order.date!) : '';
    final price = order.price;
    final distance = order.distance;

    return ImageInfoCard(
      cardKey: groupKey,
      imageUrl: imageUrl,
      margin: margin,
      infoPadding: infoPadding,
      titles: [
        Text(
          foodName.toCapitalize(),
          style: const TextStyle(fontWeight: FontWeight.bold,),
        ),
        Text(restaurantName,),
      ],
      subtitles: [
        const SizedBox(height: 8.0,),
        Text('\$${price.toStringAsFixed(2)}',),
        Text('$distance miles away',),
        Text(orderDate,),
      ],
      trailing: AddToCartButton.fromOrder(order),
    );
  }
}
