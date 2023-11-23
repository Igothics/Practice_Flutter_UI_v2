part of 'random_data_generator.dart';

extension UserGroup on RandomData{
  static final _users = List.generate(
    RandomData._maxUserCount, (index) {
      return User(
        id: index,
        uid: generateStringKey(),
        displayName: getRandomUserName(),
        email: getRandomEmail(),
        backgroundColor: getRandomColor(),
      );
    },
  );

  List<String> get getUserUids => _users.map((user) => user.uid).toList();
  List<User> get getUsers => _users;
  List<Map<String, dynamic>> get getUserJsons => _users.map((user) => user.toJson()).toList();
}
