import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/standard_title.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/user_settings_stream_provider.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSwitchTile(context, ref),
            const Divider(),
            const StandardTitle('Theme Color'),
            _buildColorList(ref),
          ],
        ),
      ),
    );
  }
  Widget _buildSwitchTile(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final userSettingsController = ref.watch(userSettingsStreamProvider.notifier);

    return SwitchListTile(
      dense: true,
      value: userSettingsController.isDarkMode(),
      onChanged: (value) => userSettingsController.updateDarkMode(value),
      title: Text('Dark mode', style: textTheme.bodyLarge,),
    );
  }
  Widget _buildColorList(WidgetRef ref){
    const primaries = Colors.primaries;
    final userSettingsController = ref.watch(userSettingsStreamProvider.notifier);

    return Expanded(
      child: GridView.builder(
        itemCount: primaries.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5,),
        itemBuilder: (_, index){
          final color = primaries[index];
          //One came rom @ColoConverter so it may different hashCode but value always be the same
          final selected = userSettingsController.isEqualSeedColor(color);
          return Stack(
            fit: StackFit.expand,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: ColoredBox(color: color,),
              ),
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                  value: selected,
                  onChanged: (_) => userSettingsController.updateSeedColor(color),
                  checkColor: Colors.white,
                  activeColor: Colors.transparent,
                  side: BorderSide.none,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
