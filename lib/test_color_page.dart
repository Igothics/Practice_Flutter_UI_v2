import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/constants/enum.dart';

class TestColorPage extends HookConsumerWidget {
  const TestColorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const amber = Colors.amber;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      floatingActionButton: SizedBox(
        width: 220,
        child: Card(
          elevation: 2.0,
          child: RadioListTile(
            value: PaymentType.credit,
            groupValue: PaymentType.credit,
            onChanged: (_){},
            title: const Text('Hello'),
          ),
        ),
      ),
      body: _buildColorList(context, ref),
    );
  }

  ListView _buildColorList(BuildContext context, WidgetRef ref) {
    const paddingFromTop = 7;
    const cardHeight = 96.0;
    final colorScheme = Theme.of(context).colorScheme;
    final primaryColorsMap = {
      for (var item in Colors.primaries) item.value.toString(): item,
    };

    final colorSchemeMap = {
      'primary': colorScheme.primary,
      'onPrimary': colorScheme.onPrimary,
      'inversePrimary': colorScheme.inversePrimary,
      'secondary': colorScheme.secondary,
      'onSecondary': colorScheme.onSecondary,
      'error': colorScheme.error,
      'onError': colorScheme.onError,
      'tertiary': colorScheme.tertiary,
      'onTertiary': colorScheme.onTertiary,
      'primaryContainer': colorScheme.primaryContainer,
      'onPrimaryContainer': colorScheme.onPrimaryContainer,
      'secondaryContainer': colorScheme.secondaryContainer,
      'onSecondaryContainer': colorScheme.onSecondaryContainer,
      'errorContainer': colorScheme.errorContainer,
      'onErrorContainer': colorScheme.onErrorContainer,
      'tertiaryContainer': colorScheme.tertiaryContainer,
      'onTertiaryContainer': colorScheme.onTertiaryContainer,
      'background': colorScheme.background,
      'onBackground': colorScheme.onBackground,
      'surface': colorScheme.surface, //
      'onSurface': colorScheme.onSurface, //
      'inverseSurface': colorScheme.inverseSurface,
      'onInverseSurface': colorScheme.onInverseSurface,
      'surfaceVariant': colorScheme.surfaceVariant,
      'onSurfaceVariant': colorScheme.onSurfaceVariant, //
      'surfaceTint': colorScheme.surfaceTint,
      'shadow': colorScheme.shadow,
      'scrim': colorScheme.scrim,
      'outline': colorScheme.outline,
      'outlineVariant': colorScheme.outlineVariant,
    };

    final testMap = colorSchemeMap;

    return ListView.builder(
      itemCount: testMap.length + paddingFromTop,
      itemBuilder: (_, index) {
        if (index < paddingFromTop) {
          return const SizedBox(
            height: cardHeight,
            child: Card(
              elevation: 0.0,
              child: Center(
                child: Text(
                  'Spare',
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ),
          );
        }
        final item = testMap.entries.toList()[index - paddingFromTop];
        return SizedBox(
          height: cardHeight,
          child: Card(
            elevation: 0.0,
            color: item.value,
            child: Center(
              child: Text(
                item.key,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
