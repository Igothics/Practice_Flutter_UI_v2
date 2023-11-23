import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/routing/router_provider.dart';
import 'package:practice_food_delivery/src/theme/theme_provider.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final lightTheme = ref.watch(baseThemeProvider(Brightness.light));
    final darkTheme = ref.watch(baseThemeProvider(Brightness.dark));
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Test food shopping App UI',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      scrollBehavior: CustomScrollBehavior(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
class CustomScrollBehavior extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}