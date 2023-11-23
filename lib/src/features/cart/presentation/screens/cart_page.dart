import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';
import 'package:practice_food_delivery/src/common_widgets/pop_icon_button.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/cart_items_builder.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/widgets/checkout_footer.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/providers/user_balance_provider.dart';

class CartPage extends HookConsumerWidget {
  const CartPage({super.key});
  static const footerStringKey = 'footer';

@override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authServiceProvider).currentUser;
    final cartItems = ref.watch(cartServiceProvider(user?.id));
    final userBalance = ref.watch(userBalanceProvider);
    final footerGlobalKey = ref.watch(globalKeyProvider(footerStringKey));
    final footerCardSize = useSizeDefine(ref,
      targetGlobalKey: footerGlobalKey,
      targetStringKey: footerStringKey,
      keys: [userBalance],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart'),
        leading: const PopIconButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(radius: 16.0,child: Text('${cartItems.length}'),),
          )
        ],
      ),
      extendBody: true,
      bottomNavigationBar: userBalance.when(
        error: (error, _) => Text('Error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) => CheckoutFooter(
          footerCardKey: footerGlobalKey,
          userBalance: data,
        ),
      ),
      body: CartItemsBuilder(
        groupKey: 'cart_item',
        data: cartItems,
        footerExtend: footerCardSize.height,
      ),
    );
  }
}