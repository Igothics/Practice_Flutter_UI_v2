import 'package:hooks_riverpod/hooks_riverpod.dart';

final isEditingProvider = StateProvider.autoDispose<bool>((ref) => false);