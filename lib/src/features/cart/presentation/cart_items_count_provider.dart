import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'cart_items_count_provider.g.dart';
@Riverpod(keepAlive: true)
int cartItemsCount(CartItemsCountRef ref) {
  final user = ref.watch(authProvider).currentUser;
  final userId = user?.id;
  final cart = ref.watch(cartProvider(userId)); // ensure updating whenever state changed
  return cart.length;
}
