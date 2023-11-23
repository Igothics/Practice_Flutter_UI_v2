import 'package:hooks_riverpod/hooks_riverpod.dart';

final isEditingProvider = AutoDisposeStateProvider<bool>((ref) => false, name: 'isEditing',);