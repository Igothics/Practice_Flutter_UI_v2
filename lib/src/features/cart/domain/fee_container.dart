import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee_container.freezed.dart';
part 'fee_container.g.dart';

@freezed
class FeeContainer with _$FeeContainer {
  const factory FeeContainer({
    @Default(0.0) double subtotal,
    @Default(0.0) double deliveryFee,
    @Default(0.0) double tax,
    @Default(0.0) double discount,
    @Default(0.0) double total,
  }) = _FeeContainer;

  factory FeeContainer.fromJson(Map<String, dynamic> json) =>
      _$FeeContainerFromJson(json);
}