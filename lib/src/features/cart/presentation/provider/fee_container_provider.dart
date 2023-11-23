import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/fee_calculate_service_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/fee_container.dart';
import 'package:practice_food_delivery/src/features/cart/application/cart_service_provider.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/chosen_coupon_provider.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fee_container_provider.g.dart';
@riverpod
FeeContainer feeContainer(FeeContainerRef ref) {
  final userId = ref.watch(authServiceProvider).currentUser?.id;
  // must have as a watcher trigger refresh feeContainer each time cart change
  final cart = ref.watch(cartServiceProvider(userId));// watcher01
  if (cart.isEmpty) {
    return const FeeContainer();
  }

  final cartController = ref.watch(cartServiceProvider(userId).notifier);
  final feeCalculateService = ref.watch(feeCalculateServiceProvider);
  final chosenCoupon = ref.watch(chosenCouponProvider(userId));// watcher02

  final activatedOrders = cartController.getAvailableOrders();
  final subtotal = feeCalculateService.calculateSubtotal(activatedOrders);
  final deliveryFee = feeCalculateService.calculateTotalDeliveryFee(activatedOrders);
  final taxVAT = feeCalculateService.calculateTax(subtotal);
  final discount = chosenCoupon == null || subtotal < chosenCoupon.minimumSpend ? 0.0 : switch(chosenCoupon.feeType){
    FeeType.orderPrice => feeCalculateService.calculateDiscount(subtotal, chosenCoupon),
    FeeType.shippingFee => feeCalculateService.calculateDiscount(deliveryFee, chosenCoupon),
    FeeType.taxFee => feeCalculateService.calculateDiscount(taxVAT, chosenCoupon),
  };
  final total = fixDouble(subtotal + deliveryFee + taxVAT - discount);

  return FeeContainer(
    subtotal: subtotal,
    deliveryFee: deliveryFee,
    tax: taxVAT,
    discount: discount,
    total: total,
  );
}
