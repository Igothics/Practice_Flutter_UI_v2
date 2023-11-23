import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'inactive_item_found_provider.g.dart';
@riverpod
bool inactiveItemFound(InactiveItemFoundRef ref) {
  final userId = ref.watch(authServiceProvider).currentUser?.id;
  final watcher = ref.watch(cartServiceProvider(userId));//ensure updating when cart state changed
  final cartController = ref.watch(cartServiceProvider(userId).notifier);//notifier never change
  return cartController.inactiveCheck();
}
