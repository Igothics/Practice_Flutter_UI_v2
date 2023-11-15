import 'package:hooks_riverpod/hooks_riverpod.dart';

final isWaitingProvider = StateProvider.autoDispose<bool>((ref) => false);