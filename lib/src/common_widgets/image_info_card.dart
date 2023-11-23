import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';
import 'package:practice_food_delivery/src/common_widgets/hero_image.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class ImageInfoCard extends HookConsumerWidget{
  const ImageInfoCard({
    super.key,
    required this.imageUrl,
    required this.cardKey,
    this.cardWith,
    this.cardHeight,
    this.enabled = true,
    this.useGradient = false,
    this.gradientStops,
    this.imageHeroTag,
    this.margin,
    this.infoPadding,
    this.onCardTapUp,
    this.imageFlex = 1,
    this.infoFlex = 2,
    this.infoMainAxisAlignment = MainAxisAlignment.center,
    this.infoCrossAxisAlignment = CrossAxisAlignment.start,
    this.titles,
    this.subtitles,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.trailing,
    this.trailingAlignment,
    this.checkBoxScale = 1.2,
    this.showCheckBox = false,
    this.checkBoxValue = true,
    this.onCheckBoxChanged,
    this.showRemoveButton = false,
    this.removeButtonScale = 0.7,
    this.onRemoveButtonPressed,
  });

  final String cardKey;
  final double? cardWith;
  final double? cardHeight;
  final bool enabled;
  final String imageUrl;
  final Object? imageHeroTag;
  final bool useGradient;
  final List<double>? gradientStops;
  final EdgeInsets? margin;
  final EdgeInsets? infoPadding;
  final ValueChanged<TapUpDetails>? onCardTapUp;
  final int? imageFlex;
  final int? infoFlex;
  final MainAxisAlignment infoMainAxisAlignment;
  final CrossAxisAlignment infoCrossAxisAlignment;
  final List<Widget>? titles;
  final List<Widget>? subtitles;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Widget? trailing;
  final Alignment? trailingAlignment;
  final bool showCheckBox;
  final double? checkBoxScale;
  final bool checkBoxValue;
  final ValueChanged<bool?>? onCheckBoxChanged;
  final double? removeButtonScale;
  final bool showRemoveButton;
  final VoidCallback? onRemoveButtonPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final defaultTitleTextStyle = textTheme.bodyLarge?.copyWith(
      color: colorScheme.onSurface,
      overflow: TextOverflow.ellipsis,
    );
    final defaultSubtitleTextStyle = textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
      overflow: TextOverflow.ellipsis,
    );

    final cardGlobalKey = ref.watch(globalKeyProvider(cardKey));
    final cardSize = useSizeDefine(ref,
      targetGlobalKey: cardGlobalKey,
      targetStringKey: cardKey,
      margin: margin,
    );

    final (double imageWith, double infoWith) = flexToSize(
      firstFlex: imageFlex,
      secondFlex: infoFlex,
      totalSize: cardSize.width,
    );
    final isStretched = infoFlex == null || infoFlex == null;

    return Stack(
      children: [
        SizedBox(
          width: cardWith,
          height: cardHeight,
          child: Card(
            key: cardGlobalKey,
            clipBehavior: Clip.antiAlias,
            margin: margin ?? EdgeInsets.zero,
            color: disableColor(color: colorScheme.background, fraction: 0.5, disabled: !enabled),
            child: AbsorbPointer(
              absorbing: !enabled,
              child: InkWell(
                onTapUp: onCardTapUp,
                child: Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        enabled ? Colors.transparent : Colors.grey.shade700,
                        BlendMode.color,
                      ),
                      child: HeroImage(
                        imageUrl,
                        heroTag: imageHeroTag ?? cardKey,
                        opacity: onCardTapUp != null ? 0.85 : 1.0,
                        width: imageWith,
                        height: cardSize.height,
                        useGradient: useGradient,
                        gradientStops: gradientStops,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: isStretched ? 0.0 : imageWith,
                      ),
                      child: SizedBox(
                        width: infoWith,
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
                    ),
                    //trick to make card expanded full. Remove it cause whole card disappear
                    const Divider(color: Colors.transparent,),
                    _buildTrailing(cardSize),
                  ],
                ),
              ),
            ),
          ),
        ),
        _buildCheckbox(context),
        _buildCloseButton(),
      ],
    );
  }
  Widget _buildTrailing(Size cardSize) => SizedBox(
    width: cardSize.width,
    height: cardSize.height,
    child: Align(
      alignment: trailingAlignment ?? Alignment.topRight,
      child: trailing,
    ),
  );
  Widget _buildCheckbox(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Positioned(
      top: -4.0,
      left: -8.0,
      child: Offstage(
        offstage: !showCheckBox,
        child: Transform.scale(
          scale: checkBoxScale,
          child: Checkbox(
            activeColor: colorScheme.primaryContainer,
            checkColor: colorScheme.onPrimaryContainer,
            value: checkBoxValue,
            onChanged: onCheckBoxChanged,
            shape: const CircleBorder(),
            side: BorderSide(
              width: 1.2,
              color: colorScheme.outline,
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildCloseButton() => Positioned(
    top: -4.0,
    right: -8.0,
    child: Offstage(
      offstage: !showRemoveButton,
      child: Transform.scale(
        scale: removeButtonScale,
        child: IconButton.filledTonal(
          onPressed: onRemoveButtonPressed,
          icon: const Icon(Icons.close),
        ),
      ),
    ),
  );
}