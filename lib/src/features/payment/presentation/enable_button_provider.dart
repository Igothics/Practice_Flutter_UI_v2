import 'package:hooks_riverpod/hooks_riverpod.dart';

final leftEnableProvider = StateProvider.autoDispose<bool>((ref) => false);
final rightEnableProvider = StateProvider.autoDispose<bool>((ref) => false);