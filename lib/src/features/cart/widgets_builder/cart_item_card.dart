import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/common_widgets/image_info_card.dart';
import 'package:practice_food_delivery/src/common_widgets/quantity_cart_item_button.dart';
import 'package:practice_food_delivery/src/features/cart/domain/item.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.keyGroup,
    required this.item,
    this.margin,
    required this.onCheckBoxChanged,
    required this.onRemoveButtonPressed,
    required this.onAddPressed,
    required this.onSubtractPressed,
  });
  final String keyGroup;
  final Item item;
  final EdgeInsets? margin;
  final ValueChanged<bool?>? onCheckBoxChanged;
  final VoidCallback? onRemoveButtonPressed;
  final VoidCallback? onAddPressed;
  final VoidCallback? onSubtractPressed;

  @override
  Widget build(BuildContext context) {
    final order = item.order;
    final imageUrl = order.imageUrl;
    final foodName = order.foodName;
    final restaurantName = order.restaurantName;
    final price = order.price;
    final distance = order.distance;

    return ImageInfoCard(
      cardId: keyGroup,
      imageUrl: imageUrl,
      useGradient: true,
      gradientStops: const [0.0, 0.5],
      margin: margin,
      infoPadding: const EdgeInsets.all(8.0),
      titles: [
        Text(foodName.toCapitalize(), style: const TextStyle(fontWeight: FontWeight.bold),),
        Text(restaurantName,),
      ],
      subtitles: [
        const SizedBox(height: 8.0,),
        Text('\$$price', style:  const TextStyle(fontWeight: FontWeight.bold),),
        Text('$distance miles away'),
      ],
      enabled: item.activated,
      showCheckBox: true,
      showRemoveButton: !item.activated,
      checkBoxValue: item.activated,
      onCheckBoxChanged: onCheckBoxChanged,
      onRemoveButtonPressed: onRemoveButtonPressed,
      trailingAlignment: Alignment.bottomRight,
      trailing: QuantityCartItemButton(
        quantity: order.quantity,
        onAddPressed: onAddPressed,
        onSubtractPressed: order.quantity < 2 ? null : onSubtractPressed,
      ),
    );
  }
}
