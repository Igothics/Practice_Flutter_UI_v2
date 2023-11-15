import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_provider/item_size_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/widgets_builder/checkout_footer.dart';
import 'package:practice_food_delivery/src/common_widgets/pop_icon_button.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:practice_food_delivery/src/features/cart/widgets_builder/cart_items_builder.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_items_count_provider.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});
  static const targetKey = 'footer';

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final cartItems = ref.watch(cartProvider(user?.id));
    final cartItemsCount = ref.watch(cartItemsCountProvider);
    final footerKey = ref.watch(globalKeyProvider(targetKey));
    final extendAmount = ref.watch(alwaysAliveSizeProvider).height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart'),
        leading: const PopIconButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(radius: 16.0,child: Text('$cartItemsCount'),),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: CheckoutFooter(cardKey: footerKey),
      body: CartItemsBuilder(
        keyGroup: 'cart_item',
        items: cartItems,
        footerExtend: extendAmount,
      ),
    );
  }
}