import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/cart_icon_button.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/providers/drawer_state_provider.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/widgets/navigation_drawer_builder.dart';

class ScaffoldWithDrawer extends HookConsumerWidget {
  const ScaffoldWithDrawer({
    super.key,
    this.child,
    this.showActions = true,
  });
  final Widget? child;
  final bool showActions;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(drawerStateProvider).title;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title,),
        actions: !showActions ? null : const [CartIconButton(),],
      ),
      drawer: const NavigationDrawerBuilder(),
      body: child,
    );
  }
}
