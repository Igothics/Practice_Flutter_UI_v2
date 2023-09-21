import 'dart:math';
import 'package:faker_dart/faker_dart.dart';
import 'package:intl/intl.dart';

int getRandomIndexFrom(List list) => Random().nextInt(list.isNotEmpty ? (list.length - 1) : 0);
int getRandomInt(int max) => Random().nextInt(max);
double getRandomRating() => Random().nextDouble() * 5;
int getRandomQuantity() => Random().nextInt(4) + 1;
double getRandomPrice() => Random().nextInt(10) + 8.99;

String getRandomRestaurantName() => Faker.instance.company.companyName();
String getRandomRestaurantAddress() {
  final faker = Faker.instance;
  final street = faker.address.streetAddress();
  final city = faker.address.cityName();

  return '$street, $city' ;
}
String getRandomUserName() => Faker.instance.name.fullName();

String formatDate(DateTime date) => DateFormat.yMMMMd('en_US').format(date);


List<T> getRandomList<T>(List<T> list, {bool shuffle = true}) {
  final rnd = Random();
  List<T> result = [];

  for (final member in list){
    if (rnd.nextBool()) {
      result.add(member);
    }
  }
  if (shuffle){
    result.shuffle();
  }

  return result;
}


