import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/providers/bottom_bar_state_provider.dart';

class ScaffoldWithBottomNavigationBar extends HookConsumerWidget {
  const ScaffoldWithBottomNavigationBar({
    super.key,
    this.child,
  });
  final Widget? child;
  static const location = ['/coupons/available', '/coupons/unavailable'];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarState = ref.watch(bottomBarStateProvider);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: bottomBarState,
        onDestinationSelected: (index) {
          ref.read(bottomBarStateProvider.notifier).update((state) => index);
          context.go(location[index]);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.confirmation_num_outlined, color: Colors.green,),
            selectedIcon: Icon(Icons.confirmation_num, color: Colors.green,),
            label: 'Available coupons',
          ),
          NavigationDestination(
            icon: Icon(Icons.confirmation_num_outlined, color: Colors.grey,),
            selectedIcon: Icon(Icons.confirmation_num, color: Colors.grey,),
            label: 'Used coupons',
          ),
        ],
      ),
      body: child,
    );
  }
}
