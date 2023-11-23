import 'package:flutter/material.dart';

enum CouponStatus{valid, invalid, unselected}
enum CouponType{percentage, fixValue, freeCharge}
enum FeeType implements Comparable<FeeType>{
  orderPrice(0, 'order price', Icons.fastfood_outlined,),
  shippingFee(1, 'shipping fee', Icons.pedal_bike_rounded,),
  taxFee(2, 'tax fee', Icons.percent_outlined);
  const FeeType(this._id, this._value, this._icon);
  final int _id;
  final String _value;
  final IconData _icon;
  String get value => _value;
  IconData get icon => _icon;
  static int get length => FeeType.values.length;
  @override
  int compareTo(FeeType other) => _id - other._id;
}
enum PaymentType implements Comparable<PaymentType>{
  credit(0, ' Credit', Icons.credit_card),
  cash(1, 'Cash', Icons.attach_money_rounded),
  coin(2, 'Coin', Icons.currency_bitcoin);
  const PaymentType(this._id, this._value, this._icon);
  final int _id;
  final String _value;
  final IconData _icon;
  String get value => _value;
  IconData get icon => _icon;
  static int get length => PaymentType.values.length;
  @override
  int compareTo(PaymentType other) => _id - other._id;
}

enum CartOperation implements Comparable<CartOperation> {
  decrease(-1), increase(1);
  const CartOperation(this._value);
  final int _value;
  int get value => _value;
  @override
  int compareTo(CartOperation other) => value - other.value;
}

enum TransferType implements Comparable<TransferType>{
  deposit(1), withdrawal(-1), payment(-1);
  const TransferType(this._value);
  final int _value;
  int get value => _value;
  String get signed => _value > 0 ? '+' : '-';

  static int get length => TransferType.values.length;
  @override
  int compareTo(TransferType other) => value - other.value;
}
enum Gender implements Comparable<Gender>{
  female('Female'),
  male('Male'),
  nonbinary('Non-binary'),
  genderqueer('Genderqueer'),
  agender('Agender'),
  bigender('Bigender'),
  genderfluid('Genderfluid'),
  twospirit('Two-spirit');
  const Gender(this._value);
  final String _value;
  String get value => _value;
  static Map<String, Gender> get genders => { for (final e in Gender.values) e.value.toString() : e };
  static int get length => Gender.values.length;
  @override
  int compareTo(Gender other) => value.length - other.value.length;
}