import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';

class CouponStatusText extends StatelessWidget {
  const CouponStatusText({super.key, required this.coupon, required this.subtotal});
  final Coupon? coupon;
  final double subtotal;

  @override
  Widget build(BuildContext context) {
    final couponStatus = _getCouponStatus();
    return switch(couponStatus){
      CouponStatus.valid => Row(
        children: [
          const Icon(Icons.confirmation_num, color: Colors.green,),
          Text(' ${_buildCouponText()}', style: const TextStyle(color: Colors.green,),),
        ],
      ),
      CouponStatus.invalid => Row(
        children: [
          const Icon(Icons.confirmation_num, color: Colors.redAccent,),
          Text(' Subtotal must reach \$${coupon?.minimumSpend}', style: const TextStyle(color: Colors.redAccent,),),
        ],
      ),
      CouponStatus.unselected => const Row(
        children: [
          Icon(Icons.confirmation_num_outlined, color: Colors.grey,),
          Text(' Choose Coupon', style: TextStyle(color: Colors.grey,),),
        ],
      ),
    };
  }
  CouponStatus _getCouponStatus() {
    if (coupon != null) {
      if (subtotal >= coupon!.minimumSpend) {
        return CouponStatus.valid;
      }
      return CouponStatus.invalid;
    }
    return CouponStatus.unselected;
  }
  String _buildCouponText() => switch (coupon) {
    CouponPercentage data => 'Discount ${data.value * 100}% on ${data.feeType.value}',
    CouponFixValue data => 'Discount \$${data.value} on ${data.feeType.value}',
    CouponFreeCharge data => 'Free charge on ${data.feeType.value}',
    _ => 'Unknown coupon',
  };
}

