import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/widgets/dark_mode_switch_tile.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/widgets/seed_color_grid_builder.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DarkModeSwitchTile(),
            Divider(),
            StandardTitle('Theme Color'),
            Expanded(child: SeedColorGridBuilder(),),
          ],
        ),
      ),
    );
  }
}
