import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'active_button_state_provider.g.dart';
@riverpod
bool inactiveItemFound(InactiveItemFoundRef ref) {
  final user = ref.watch(authProvider).currentUser;
  final userId = user?.id;
  final watcher = ref.watch(cartProvider(userId));//ensure updating when cart state changed
  final cartController = ref.watch(cartProvider(userId).notifier);//notifier never change
  return cartController.inactiveCheck();
}
