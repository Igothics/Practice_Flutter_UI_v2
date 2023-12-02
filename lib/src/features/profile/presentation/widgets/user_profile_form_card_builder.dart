import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/common_use_hook/use_size_define.dart';
import 'package:practice_food_delivery/src/common_widgets/simple_sized_card.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/widgets/user_profile_form_card.dart';
class UserProfileFormCardBuilder extends HookConsumerWidget {
  const UserProfileFormCardBuilder({
    super.key,
    required this.formKey,
    required this.groupKey,
    this.isWaiting = false,
    this.margin = EdgeInsets.zero,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });
  final GlobalKey<FormState>? formKey;
  final String groupKey;
  final bool isWaiting;
  final EdgeInsets? margin;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardKey = ref.watch(globalKeyProvider(groupKey));
    final cardSize = useSizeDefine(ref,
      targetGlobalKey: cardKey,
      targetStringKey: groupKey,
      margin: margin,
    );

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
