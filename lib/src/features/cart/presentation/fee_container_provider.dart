import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/cart/application/fee_calculator_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/fee_container.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/chosen_coupon_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fee_container_provider.g.dart';
@Riverpod(keepAlive: true)
FeeContainer feeContainer(FeeContainerRef ref) {
  final userId = ref.watch(authProvider).currentUser?.id;
  final cart = ref.watch(cartProvider(userId));
  if (cart.isEmpty) {
    return const FeeContainer();
  }

  final cartController = ref.watch(cartProvider(userId).notifier);
  final feeCalculator = ref.watch(feeCalculatorProvider);
  final chosenCoupon = ref.watch(chosenCouponProvider(userId));

  final orders = cartController.getAvailableOrders();
  final subtotal = feeCalculator.calculateSubtotal(orders);
  final deliveryFee = feeCalculator.calculateTotalDeliveryFee(orders);
  final taxVAT = feeCalculator.calculateTax(subtotal);
  final discount = chosenCoupon == null || chosenCoupon.minimumSpend > subtotal ? 0.0 : switch(chosenCoupon.feeType){
    FeeType.orderPrice => feeCalculator.calculateDiscount(subtotal, chosenCoupon),
    FeeType.shippingFee => feeCalculator.calculateDiscount(deliveryFee, chosenCoupon),
    FeeType.taxFee => feeCalculator.calculateDiscount(taxVAT, chosenCoupon),
  };
  final total = subtotal + deliveryFee + taxVAT - discount;

  return FeeContainer(
    subtotal: subtotal,
    deliveryFee: deliveryFee,
    tax: taxVAT,
    discount: discount,
    total: total,
  );
}
