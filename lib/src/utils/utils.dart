import 'dart:convert';
import 'dart:math';
import 'package:faker_dart/faker_dart.dart' hide Gender;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';
import 'package:practice_food_delivery/src/constants/regex.dart';
import 'package:practice_food_delivery/src/features/coupon_box/domain/coupon.dart';
import 'package:practice_food_delivery/src/features/navigation/domain/drawer_item.dart';
import 'package:practice_food_delivery/src/features/orders_history/domain/order.dart';
import 'package:practice_food_delivery/src/features/payment/domain/transfer.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';

final _rnd = Random();
final _recordDateFormat = DateFormat.yMMMd();
final _birthDateFormat = DateFormat.yMd();
final _detailDateFormat = DateFormat.yMMMd().add_Hm();
final _faker = Faker.instance;
const _colors = Colors.primaries;
final _colorCount = _colors.length;

double fixDouble(double num, {int fixed = 2}) => double.parse(num.toStringAsFixed(fixed));
String encrypt(String input) => base64.encode(input.codeUnits);
String decrypt(String encoded) => utf8.decode(base64.decode(encoded));
bool randomBool() => _rnd.nextBool();
int randomInt(int max, {int min = 0, bool equalMax = true}) => max == 0 ? 0 : _rnd.nextInt(max + (equalMax ? 1 : 0) - min) + min;
double randomDouble(int max, {int min = 0, bool equalMax = true, int fixed = 2}){
  final scale = pow(10,fixed) as int; // to fix long generated decimal
  return randomInt(max * scale, min: min * scale, equalMax: equalMax)/scale;
}
Iterable<String> getRandomCharIterable(int length) sync* {
  for(int i = 0; i < length; i++){
    yield String.fromCharCode(randomInt(126, min: 33));
  }
}
Iterable<int> getRandomIntIterable(int length) sync* {
  for(int i = 0; i < length; i++){
    yield randomInt(9);
  }
}

bool getRandomAvailable() => randomBool();
int getRandomMaxUsageCount() => randomInt(3, min: 1);
double getRandomPercentage() => (5 * randomInt(6, min: 1)) / 100;
double getRandomValue() => 5.0 * randomInt(6, min: 1);
double getRandomMaxDiscount() => 10.0 * randomInt(3, min: 1);
double getRandomMinimumSpend() => 30.0 * randomInt(6, min: 1);
List<String> getRandomUsedCoupons(List<Coupon> coupons) {
  final result = <String>[];
  for(final coupon in coupons){
    for(int i = 0; i < coupon.maxUsageCount; i++){
      result.add(coupon.code);
    }
  }
  return getRandomList(result);
}

bool getRandomDarkModeState() => _rnd.nextBool();
int getRandomIndexFromList(List list) => randomInt(list.length, equalMax: false);
T getRandomItemFromList<T>(List<T> list) => list.elementAt(getRandomIndexFromList(list),);
Color getRandomColor() => _colors[randomInt(_colorCount, equalMax: false)];
Color getHarmonizedRandomColor(Color primaryColor) => _colors[randomInt(_colorCount, equalMax: false)].harmonizeWith(primaryColor);
double getRandomRating() => randomDouble(5, min: 3, equalMax: false, fixed: 1);
double getRandomBalance() => randomDouble(500, min: 200);
double getRandomTransferAmount() => randomDouble(200, min: 50);
TransferType getRandomTransferType() => TransferType.values[randomInt(TransferType.length, equalMax: false)];
PaymentType getRandomPaymentType() => PaymentType.values[randomInt(PaymentType.length, equalMax: false)];
String getRandomTransferCode() => getRandomCharIterable(20).join();
String getRandomReferenceCode() => getRandomIntIterable(12).join();
String getRandomCouponCode() => getRandomIntIterable(8).join();
Gender getRandomGender() => Gender.values[randomInt(Gender.length, equalMax: false)];
int getRandomQuantity() => randomInt(5, min: 1);
double getRandomPrice() => randomInt(18, min: 8) + 0.99;
double getRandomDistance() => randomDouble(3, min: 1, fixed: 1);
String getRandomUserName() => _faker.name.fullName();
String getRandomEmail() => _faker.internet.email();
String getRandomPhoneNumber() => _faker.phoneNumber.phoneNumber(format: '0#########');
String getRandomRestaurantName() => _faker.company.companyName();
String getRandomAddress() => '${randomInt(100)} ${_faker.address.streetName()}, ${_faker.address.cityName()}';
Duration getRandomDuration() => Duration(
  days: randomInt(365),
  hours: randomInt(12),
  minutes: randomInt(60),
  seconds: randomInt(60),
);
DateTime noHms(DateTime dateTime) => dateTime.copyWith(
  hour: 0,
  minute: 0,
  second: 0,
  millisecond: 0,
  microsecond: 0,
);
DateTime getDateTimeNow() => DateTime.now();
int getCurrentYear() => getDateTimeNow().year;
DateTime getRandomBackwardDate({int yearOffset = 0}) => getDateTimeNow()
    .copyWith(year: getCurrentYear() - yearOffset)
    .subtract(getRandomDuration());
DateTime getRandomForwardDate({int yearOffset = 0}) => getDateTimeNow()
    .copyWith(year: getCurrentYear() + yearOffset)
    .add(getRandomDuration());
DateTime getRandomBirthday() => noHms(getRandomBackwardDate(yearOffset: randomInt(40, min: 30)));
String formatRecordDate(DateTime date) => _recordDateFormat.format(date);
String formatBirthDate(DateTime date) => _birthDateFormat.format(date);
String formatDetailDateTime(DateTime date) => _detailDateFormat.format(date);

List<T> getRandomList<T>(List<T> list, {bool shuffle = true}) {
  List<T> result = [];
  for (final member in list){
    if (_rnd.nextBool()) {
      result.add(member);
    }
  }
  if (shuffle){
    result.shuffle();
  }
  return result;
}
List<E> reindex<E>(List<E> list, {int offset = 0}) {
  return switch(list){
    List<Order> list => list.mapWithIndex<Order>((i, e) => e.copyWith(id: i + offset),) as Iterable<E>,
    List<Transfer> list => list.mapWithIndex<Transfer>((i, e) => e.copyWith(id: i + offset),) as Iterable<E>,
    List<DrawerItem> list => list.mapWithIndex<DrawerItem>((i, e) => e.copyWith(id: i + offset),) as Iterable<E>,
    List<Coupon> list => list.mapWithIndex<Coupon>((i, e) => e.copyWith(id: i + offset),) as Iterable<E>,
    _ => list,
  }.toList();
}

(double, double) flexToSize({int? firstFlex = 1,int? secondFlex = 1, double? totalSize,}) {
  if (totalSize == null) {
    return (fixDouble(0.0), fixDouble(0.0));
  }
  if (firstFlex == null || secondFlex == null) {
    return (fixDouble(totalSize), fixDouble(totalSize));
  }

  final denominator = firstFlex + secondFlex;
  final firstSize = totalSize * firstFlex / denominator;
  final secondSize = totalSize * secondFlex / denominator;

  return (fixDouble(firstSize), fixDouble(secondSize));
}
String cleanRedundantSpaces(String value) => value.trim().replaceAll(RegExp(Regex.doubleSpaces), ' ');
String cleanAllSpaces(String value) => value.replaceAll(' ', '');
Color disableColor({required Color color, double fraction = 1.0, required bool disabled}) => disabled ? Color.lerp(color, Colors.grey, fraction)! : color;
String buildCouponTitles(Coupon coupon) => switch(coupon){
  CouponPercentage data => 'Discount ${data.value * 100}% on ${data.feeType.value} up to \$${data.maxDiscount}\nWhen orders reach \$${data.minimumSpend}',
  CouponFixValue data => 'Discount \$${data.value} on ${data.feeType.value}\nWhen orders reach \$${data.minimumSpend}',
  CouponFreeCharge data => 'Free charge on ${data.feeType.value}\nWhen orders reach \$${data.minimumSpend}',
};