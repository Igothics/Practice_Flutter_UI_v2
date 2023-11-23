class UserNotFound implements Exception {
  final String message;
  UserNotFound({this.message = 'User not found!'});
  @override
  String toString() {
    return "UserNotFound: $message";
  }
}