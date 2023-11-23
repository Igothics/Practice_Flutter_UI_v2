import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

final paymentTypeProvider = StateProviderFamily<PaymentType, int?>(
  (ref, userId) => PaymentType.values.first,
  name: 'paymentType',
);