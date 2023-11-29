import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/database/fake_database_provider.dart';
import 'package:practice_food_delivery/src/my_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class WarmUp extends ConsumerStatefulWidget {
  const WarmUp({super.key});

  @override
  ConsumerState<WarmUp> createState() => _WarmUpState();
}
class _WarmUpState extends ConsumerState<WarmUp> {
  bool finished = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    log('[WarmUp Round ${count++}]: finished: $finished');

    if (finished) {
      FlutterNativeSplash.remove();
      return const MyApp();
    }

    final dataRepo = ref.watch(fakeDatabaseProvider);
    switch (dataRepo) {
      case AsyncData():
        log('[WarmUp]: FakeDatabase initialized!: ${dataRepo.value}');
        Future(() => setState(() => finished = true));
      case AsyncError(): log('[WarmUp]: FakeDatabase got error: ${dataRepo.error}');
      default: log('[WarmUp]: FakeDatabase initializing...');
    }

    log('='*30);
    return const Material(child: Center(child: CircularProgressIndicator(),));
  }
}