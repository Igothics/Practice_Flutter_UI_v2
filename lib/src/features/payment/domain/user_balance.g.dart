// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBalanceImpl _$$UserBalanceImplFromJson(Map<String, dynamic> json) =>
    _$UserBalanceImpl(
      id: json['id'] as int,
      balance: (json['balance'] as num).toDouble(),
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      transferLog: (json['transferLog'] as List<dynamic>)
          .map((e) => Transfer.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserBalanceImplToJson(_$UserBalanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'transferLog': instance.transferLog.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };

_$UserBalanceZeroImpl _$$UserBalanceZeroImplFromJson(
        Map<String, dynamic> json) =>
    _$UserBalanceZeroImpl(
      id: json['id'] as int? ?? 0,
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
      updateAt: json['updateAt'] == null
          ? null
          : DateTime.parse(json['updateAt'] as String),
      transferLog: (json['transferLog'] as List<dynamic>?)
              ?.map((e) => Transfer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UserBalanceZeroImplToJson(
        _$UserBalanceZeroImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'createAt': instance.createAt?.toIso8601String(),
      'updateAt': instance.updateAt?.toIso8601String(),
      'transferLog': instance.transferLog.map((e) => e.toJson()).toList(),
      'runtimeType': instance.$type,
    };
