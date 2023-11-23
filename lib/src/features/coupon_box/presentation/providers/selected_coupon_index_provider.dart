import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedCouponIndexProvider = StateProviderFamily<int?, int?>(
  (ref, userId) => null,
  name: 'selectedCouponIndex',
);