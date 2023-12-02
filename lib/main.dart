import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/my_observer.dart';
import 'package:practice_food_delivery/src/warm_up.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(
      observers: [MyObserver(providerNames: ['sizeStore'])],
      child: WarmUp(),
    ),
  );
}
