import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_service.dart';

final authServiceProvider = ChangeNotifierProvider(
  (ref) => AuthService(),
  name: 'authService',
);