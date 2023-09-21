import 'dart:math';
import 'package:faker_dart/faker_dart.dart';
import 'package:intl/intl.dart';

final _rnd = Random();
final _dateFormat = DateFormat.yMMMMd('en_US');
final _faker = Faker.instance;

int getRandomIndexFromList(List list) => list.isNotEmpty ? _rnd.nextInt(list.length - 1) : 0;
int getRandomInt(int max) => _rnd.nextInt(max);
double getRandomRating() => double.parse((_rnd.nextDouble() * 5).toStringAsFixed(1));
int getRandomQuantity() => _rnd.nextInt(4) + 1;
double getRandomPrice() => _rnd.nextInt(10) + 8.99;

String getRandomUserName() => _faker.name.fullName();
String getRandomRestaurantName() => _faker.company.companyName();
String getRandomRestaurantAddress() => '${_faker.address.streetAddress()}, ${_faker.address.cityName()}';
String formatDate(DateTime date) => _dateFormat.format(date);

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


