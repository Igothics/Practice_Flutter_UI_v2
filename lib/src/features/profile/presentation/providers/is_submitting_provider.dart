import 'package:hooks_riverpod/hooks_riverpod.dart';

final isSubmittingProvider = AutoDisposeStateProvider<bool>((ref) => false, name: 'isSubmitting',);