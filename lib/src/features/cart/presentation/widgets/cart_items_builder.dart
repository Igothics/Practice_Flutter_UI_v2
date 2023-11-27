import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/custom_animation.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/item.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/cart_item_card.dart';

class CartItemsBuilder extends HookConsumerWidget {
  const CartItemsBuilder({
    super.key,
    required this.groupKey,
    required this.data,
    this.footerExtend,
    this.margin = const EdgeInsets.symmetric(vertical: 4.0,),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0,),
  });
  final String groupKey;
  final List<Item> data;
  final double? footerExtend;

  final EdgeInsets? margin;
  final EdgeInsets? listPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authServiceProvider).currentUser;
    final cartController = ref.watch(cartServiceProvider(user?.id).notifier);

    return StoredListView(
        storeKey: groupKey,
        listPadding: listPadding,
        itemCount: data.length + 1,
        itemBuilder: (_, index){
          if (index == data.length) {
            return SizedBox(height: footerExtend,);
          }
          final item = data[index];

          return CustomAnimation.fadeSlide(
            delay: 150.ms * index,
            direction: SlideAxis.leftToRight,
            child: CartItemCard(
              groupKey: '$groupKey-$index',
              item: item,
              margin: margin,
              onCheckBoxChanged: (_)=> cartController.toggleItem(index),
              onRemoveButtonPressed: () => cartController.removeItem(index),
              onAddPressed: () => cartController.updateQuantity(index, CartOperation.increase),
              onSubtractPressed: () => cartController.updateQuantity(index, CartOperation.decrease),
            ),
          );
        },
    );
  }
}
