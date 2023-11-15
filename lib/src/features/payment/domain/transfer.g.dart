// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransferImpl _$$TransferImplFromJson(Map<String, dynamic> json) =>
    _$TransferImpl(
      id: json['id'] as int?,
      amount: (json['amount'] as num).toDouble(),
      transferType: $enumDecode(_$TransferTypeEnumMap, json['transferType']),
      paymentType: $enumDecode(_$PaymentTypeEnumMap, json['paymentType']),
      transferCode: json['transferCode'] as String,
      referenceCode: json['referenceCode'] as String,
      transferDate: DateTime.parse(json['transferDate'] as String),
    );

Map<String, dynamic> _$$TransferImplToJson(_$TransferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'transferType': _$TransferTypeEnumMap[instance.transferType]!,
      'paymentType': _$PaymentTypeEnumMap[instance.paymentType]!,
      'transferCode': instance.transferCode,
      'referenceCode': instance.referenceCode,
      'transferDate': instance.transferDate.toIso8601String(),
    };

const _$TransferTypeEnumMap = {
  TransferType.deposit: 'deposit',
  TransferType.withdrawal: 'withdrawal',
  TransferType.payment: 'payment',
};

const _$PaymentTypeEnumMap = {
  PaymentType.credit: 'credit',
  PaymentType.cash: 'cash',
  PaymentType.coin: 'coin',
};
