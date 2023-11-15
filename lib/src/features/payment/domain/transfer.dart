import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

part 'transfer.freezed.dart';
part 'transfer.g.dart';

@freezed
class Transfer with _$Transfer {
  const factory Transfer({
    int? id,
    required double amount,
    required TransferType transferType,
    required PaymentType paymentType,
    required String transferCode,
    required String referenceCode,
    required DateTime transferDate,
  }) = _Transfer;

  factory Transfer.fromJson(Map<String, dynamic> json) =>
      _$TransferFromJson(json);
}