import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomBarStateProvider = AutoDisposeStateProvider<int>((ref) => 0, name: 'bottomBarState',);