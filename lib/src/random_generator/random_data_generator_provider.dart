import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/random_generator/random_data_generator.dart';

final randomDataProvider = AutoDisposeProvider<RandomData>(
  (ref) => RandomData(
    maxUserCount: 3,
    maxUserOrderCount: 10,
    maxUserTransactionCount: 20,
    maxCouponCount: 30,
  ),
  name: 'randomData',
);
