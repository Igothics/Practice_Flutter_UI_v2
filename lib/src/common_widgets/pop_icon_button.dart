import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/drawer_state_provider.dart';

class PopIconButton extends HookConsumerWidget {
  const PopIconButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: (){
        ref.refresh(drawerStateProvider); // reset selected index when back to home
        context.pop();
      },
      icon: const Icon(Icons.arrow_back,),
    );
  }
}
