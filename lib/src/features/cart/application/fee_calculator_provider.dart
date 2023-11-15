import 'package:practice_food_delivery/src/features/cart/application/fee_calculator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fee_calculator_provider.g.dart';

@Riverpod(keepAlive: true)
FeeCalculator feeCalculator(FeeCalculatorRef ref) {
  return const FeeCalculator();
}
