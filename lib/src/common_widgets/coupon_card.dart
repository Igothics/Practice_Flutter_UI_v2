import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_provider/item_size_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';
import 'package:practice_food_delivery/src/theme/theme_provider.dart';

class CouponCard extends HookConsumerWidget {
  const CouponCard({
    super.key,
    this.enabled = true,
    this.selected = false,
    required this.cardId,
    required this.icon,
    required this.titles,
    required this.subtitles,
    required this.trailing,
    this.margin,
    this.infoPadding,
    this.iconFlex = 1,
    this.infoFlex = 5,
    this.trailingFlex = 1,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.onPressed,
    this.infoMainAxisAlignment = MainAxisAlignment.start,
    this.infoCrossAxisAlignment = CrossAxisAlignment.start,
  });
  final bool enabled;
  final bool selected;
  final String cardId;
  final Widget? icon;
  final List<Widget>? titles;
  final List<Widget>? subtitles;
  final Widget? trailing;
  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;
  final int iconFlex;
  final int infoFlex;
  final int trailingFlex;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final VoidCallback? onPressed;
  final MainAxisAlignment infoMainAxisAlignment;
  final CrossAxisAlignment infoCrossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final greyColor = switch(themeMode){
      ThemeMode.light => Colors.grey.shade400,
      ThemeMode.dark => Colors.grey.shade800,
      _ => Colors.grey.shade500,
    };
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final defaultTitleTextStyle = textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface,);
    final defaultSubtitleTextStyle = textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant);
    final colorFilter = ColorFilter.mode(enabled ? Colors.transparent : greyColor, BlendMode.color);
    final textButtonStyle = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(),
    );
    final elevation = selected ? 10.0 : 0.5;
    final infoKey = ref.watch(globalKeyProvider('$cardId:info'));
    useSizeDefine(
      ref.read(autoDisposeSizeProvider('$cardId:info').notifier),
      targetKey: infoKey,
      trackKey: '$cardId:info',
    );
    final infoSize = ref.watch(autoDisposeSizeProvider('$cardId:info'));

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            flex: iconFlex + infoFlex,
            child: Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              elevation: elevation,
              child: ColorFiltered(
                colorFilter: colorFilter,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: !enabled ? null : onPressed,
                  child: Stack(
                    children: [
                      const Divider(color: Colors.transparent,),// trick to make color expand full card
                      Row(
                        children: [
                          Expanded(
                            flex: iconFlex,
                            child: SizedBox(
                              height: infoSize.height,
                              child: ColoredBox(
                                color: colorScheme.primaryContainer,
                                child: icon,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: infoFlex,
                            child: Padding(
                              key: infoKey,
                              padding: infoPadding ?? EdgeInsets.zero,
                              child: Column(
                                mainAxisAlignment: infoMainAxisAlignment,
                                crossAxisAlignment: infoCrossAxisAlignment,
                                children: [
                                  DefaultTextStyle(
                                    style: defaultTitleTextStyle!.merge(titleTextStyle),
                                    child: Column(
                                      crossAxisAlignment: infoCrossAxisAlignment,
                                      children: titles ?? [],
                                    ),
                                  ),
                                  DefaultTextStyle(
                                    style: defaultSubtitleTextStyle!.merge(subtitleTextStyle),
                                    child: Column(
                                      crossAxisAlignment: infoCrossAxisAlignment,
                                      children: subtitles ?? [],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: trailingFlex,
            child: SizedBox(
              height: infoSize.height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                elevation: elevation,
                child: ColorFiltered(
                  colorFilter: colorFilter,
                  child: TextButton(
                    style: textButtonStyle,
                    onPressed: !enabled ? null : onPressed,
                    child: DefaultTextStyle(
                      style: defaultSubtitleTextStyle,
                      child: trailing ?? const SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
