import 'package:practice_food_delivery/src/features/cart/application/fee_calculate_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fee_calculate_service_provider.g.dart';

@riverpod
FeeCalculateService feeCalculateService(FeeCalculateServiceRef ref) {
  return const FeeCalculateService();
}
