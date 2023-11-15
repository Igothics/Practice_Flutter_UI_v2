import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final globalKeyProvider = Provider.family<GlobalKey, String>((ref, key) => GlobalKey());

final globalKeyNavigatorStateProvider = Provider.family<GlobalKey<NavigatorState>, String>((ref, key){
  log('[global navigator state]: $key');
  return GlobalKey<NavigatorState>(debugLabel: key);
});
