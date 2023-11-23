import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/settings/data/user_settings_repository_provider.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/providers/is_selected_color_provider.dart';

class SeedColorGridBuilder extends HookConsumerWidget {
  const SeedColorGridBuilder({
    super.key,
    this.crossAxisCount = 5,
    this.checkBoxScale = 1.5,
    this.gap = 4.0,
  });
  final double gap;
  final int crossAxisCount;
  final double checkBoxScale;
  static const _primaries = Colors.primaries;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSettingsRepository = ref.watch(userSettingsRepositoryProvider);

    return GridView.builder(
      itemCount: _primaries.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: gap,
        crossAxisSpacing: gap,
      ),
      itemBuilder: (_, index){
        final color = _primaries[index];
        final isSelected = ref.watch(isSelectedColorProvider(color.value));

        return Stack(
          fit: StackFit.expand,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              child: ColoredBox(color: color,),
            ),
            Transform.scale(
              scale: checkBoxScale,
              child: Checkbox(
                value: isSelected,
                onChanged: (_) async {
                  if (!isSelected) {
                    await userSettingsRepository.updateSeedColor(color);
                  }
                },
                checkColor: Colors.white,
                activeColor: Colors.transparent,
                side: BorderSide.none,
              ),
            ),
          ],
        );
      },
    );
  }
}
