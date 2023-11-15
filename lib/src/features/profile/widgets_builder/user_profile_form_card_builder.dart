import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_provider/item_size_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_sized_card.dart';
import 'package:practice_food_delivery/src/features/profile/widgets_builder/user_profile_form_card.dart';

class UserProfileFormCardBuilder extends HookConsumerWidget {
  const UserProfileFormCardBuilder({
    super.key,
    required this.formKey,
    required this.keyGroup,
    this.isWaiting = false,
    this.margin = EdgeInsets.zero,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  final GlobalKey<FormState>? formKey;
  final String keyGroup;
  final bool isWaiting;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardKey = ref.watch(globalKeyProvider(keyGroup));
    useSizeDefine(
      ref.read(autoDisposeSizeProvider(keyGroup).notifier),
      targetKey: cardKey,
      trackKey: keyGroup,
    );
    // // because of autoDispose!? We can't use returned size above
    final cardSize = ref.watch(autoDisposeSizeProvider(keyGroup));

    return isWaiting
        ? SimpleSizedCard.loading(height: cardSize.height,)
        : UserProfileFormCard(
            cardKey: cardKey,
            formKey: formKey,
            margin: margin,
            contentPadding: contentPadding,
    );
  }
}
