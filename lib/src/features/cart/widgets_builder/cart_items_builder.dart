import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/stored_list_view.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/item.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:practice_food_delivery/src/features/cart/widgets_builder/cart_item_card.dart';

class CartItemsBuilder extends HookConsumerWidget {
  const CartItemsBuilder({
    super.key,
    required this.keyGroup,
    required this.items,
    this.footerExtend,
    this.margin = const EdgeInsets.symmetric(vertical: 4.0,),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16.0,),
  });
  final String keyGroup;
  final List<Item> items;
  final double? footerExtend;

  final EdgeInsets? margin;
  final EdgeInsets? listPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final cartController = ref.watch(cartProvider(user?.id).notifier);

    return StoredListView(
        storeKey: keyGroup,
        listPadding: listPadding,
        itemCount: items.length + 1,
        itemBuilder: (_, index){
          if (index == items.length) {
            return SizedBox(height: footerExtend,);
          }
          final item = items[index];

          return CartItemCard(
            keyGroup: '$keyGroup-$index',
            item: item,
            margin: margin,
            onCheckBoxChanged: (_)=> cartController.toggleItem(index),
            onRemoveButtonPressed: () => cartController.removeItem(index),
            onAddPressed: () => cartController.updateQuantity(index, CartOperation.increase),
            onSubtractPressed: () => cartController.updateQuantity(index, CartOperation.decrease),
          );
        },
    );
  }
}
