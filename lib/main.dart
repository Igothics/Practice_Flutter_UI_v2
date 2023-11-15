import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/theme/theme_provider.dart';
import 'package:practice_food_delivery/src/routing/router_provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: WarmUp()));
}

class WarmUp extends ConsumerStatefulWidget {
  const WarmUp({super.key});

  @override
  ConsumerState<WarmUp> createState() => _WarmUpState();
}
class _WarmUpState extends ConsumerState<WarmUp> {
  bool warmedUp = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    log('Round ${count++} - warmedUp: $warmedUp');

    if (warmedUp) {
      return const MyApp();
    }

    final dataRepo = ref.watch(databaseRepositoryProvider);
    switch (dataRepo) {
      case AsyncData():
        log('databaseRepository initialized!: $dataRepo');
        Future(() => setState(() => warmedUp = true));
      case AsyncError(): log('databaseRepository error: ${dataRepo.error}');
      default: log('databaseRepository initializing...');
    }

    log('='*30);
    return const Center(child: CircularProgressIndicator(),);
  }
}

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