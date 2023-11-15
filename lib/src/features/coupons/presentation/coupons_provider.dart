import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/coupons/domain/coupon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'coupons_provider.g.dart';

@riverpod
Future<List<Coupon>> coupons(CouponsRef ref) async {
  final database = ref.watch(databaseRepositoryProvider).requireValue;
  return database.getAllCoupons();
}
