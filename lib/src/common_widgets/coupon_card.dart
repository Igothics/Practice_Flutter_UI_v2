import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final defaultTitleTextStyle = textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface,);
    final defaultSubtitleTextStyle = textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant);
    final textButtonStyle = TextButton.styleFrom(
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(),
    );
    final elevation = selected ? 10.0 : 0.5;
    final cardGlobalKey = ref.watch(globalKeyProvider(cardId));
    final cardSize = useSizeDefine(ref,
      targetGlobalKey: cardGlobalKey,
      targetStringKey: cardId,
      // no margin involved here because we're using fake margin. It's not Card's margin property
    );

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            flex: iconFlex + infoFlex,
            child: Card(
              key: cardGlobalKey,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              elevation: elevation,
              color: disableColor(color: colorScheme.background, fraction: 0.5, disabled: !enabled),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  padding: EdgeInsets.zero,
                ),
                onPressed: !enabled ? null : onPressed,
                child: Row(
                  children: [
                    Expanded(
                      flex: iconFlex,
                      child: SizedBox(
                        height: cardSize.height,
                        child: ColoredBox(
                          color: disableColor(color: colorScheme.primaryContainer, disabled: !enabled),
                          child: icon,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: infoFlex,
                      child: Padding(
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
              ),
            ),
          ),
          Expanded(
            flex: trailingFlex,
            child: SizedBox(
              height: cardSize.height,
              child: Card(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                elevation: elevation,
                color: disableColor(color: colorScheme.background, fraction: 0.5, disabled: !enabled),
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
        ],
      ),
    );
  }
}
