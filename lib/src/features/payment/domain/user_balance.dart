import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';

part 'user_balance.freezed.dart';
part 'user_balance.g.dart';

@freezed
class UserBalance with _$UserBalance {
  @JsonSerializable(explicitToJson: true)
  const factory UserBalance({
    required int id,
    required double balance,
    required DateTime? createAt,
    required DateTime? updateAt,
    required List<Transfer> transferLog,
  }) = _UserBalance;

  @JsonSerializable(explicitToJson: true)
  const factory UserBalance.zero({
    @Default(0) int id,
    @Default(0.0) double balance,
    @Default(null) DateTime? createAt,
    @Default(null) DateTime? updateAt,
    @Default([]) List<Transfer> transferLog,
  }) = _UserBalanceZero;

  factory UserBalance.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceFromJson(json);
}