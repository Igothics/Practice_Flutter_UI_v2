import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/my_observer.dart';
import 'package:practice_food_delivery/src/warm_up.dart';

void main() {
  runApp(ProviderScope(
      observers: [MyObserver(providers: [])],
      child: const WarmUp(),
    ),
  );
}
