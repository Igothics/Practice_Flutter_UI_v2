import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

final paymentTypeProvider = StateProvider.family<PaymentType, int?>((ref, id) => PaymentType.values.first);