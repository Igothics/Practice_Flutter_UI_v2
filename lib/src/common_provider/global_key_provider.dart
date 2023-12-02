import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final globalKeyProvider = AutoDisposeProviderFamily<GlobalKey, String>(
  (ref, key) => GlobalKey(),
  name: 'globalKey',
);
final formStateGlobalKeyProvider = AutoDisposeProvider<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
  name: 'formStateGlobalKey',
);
final navigatorStateGlobalKeyProvider = AutoDisposeProviderFamily<GlobalKey<NavigatorState>, String>(
  (ref, key) => GlobalKey<NavigatorState>(debugLabel: key),
  name: 'navigatorStateGlobalKey',
);