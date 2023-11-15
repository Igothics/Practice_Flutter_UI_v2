import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/bottom_bar_state_provider.dart';
import 'package:practice_food_delivery/src/features/navigation/domain/navigation_drawer_item.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

final destinationItemsProvider = AutoDisposeProvider(
  (ref) => reindex<NavigationDrawerItem>([
      const NavigationDrawerItem(
        title: 'Food Delivery',
        location: '/',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text(
            'Home',
          ),
        ),
      ),
      const NavigationDrawerItem(
        title: 'Profile',
        location: '/user_profile',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.account_circle_outlined),
          selectedIcon: Icon(Icons.account_circle),
          label: Text(
            'Profile',
          ),
        ),
      ),
      NavigationDrawerItem(
        title: 'My Coupons',
        // location: '/coupons',
        location: '/coupons/available',
        onEnter: () => ref.refresh(bottomBarStateProvider),
        destination: const NavigationDrawerDestination(
          icon: Icon(Icons.confirmation_num_outlined),
          selectedIcon: Icon(Icons.confirmation_num),
          label: Text(
            'Coupons',
          ),
        ),
      ),
      const NavigationDrawerItem(
        title: 'My Favorites',
        location: '/favorites',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.favorite_border_rounded),
          selectedIcon: Icon(Icons.favorite_rounded),
          label: Text(
            'Favorites',
          ),
        ),
      ),
      const NavigationDrawerItem(
        title: 'My Orders',
        location: '/orders_history',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.bookmarks_outlined),
          selectedIcon: Icon(Icons.bookmarks),
          label: Text(
            'Orders',
          ),
        ),
      ),
      const NavigationDrawerItem(
        title: 'Payment',
        location: '/payment',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.monetization_on_outlined),
          selectedIcon: Icon(Icons.monetization_on_rounded),
          label: Text(
            'Payments',
          ),
        ),
      ),
      const NavigationDrawerItem(
        title: 'Settings',
        location: '/settings',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.settings_display_outlined),
          selectedIcon: Icon(Icons.settings_display_rounded),
          label: Text(
            'Settings',
          ),
        ),
      ),
      const NavigationDrawerItem(
        title: 'Help Center',
        location: '/help',
        destination: NavigationDrawerDestination(
          icon: Icon(Icons.headset_mic_outlined),
          selectedIcon: Icon(Icons.headset_mic_rounded),
          label: Text(
            'Help Center',
          ),
        ),
      ),
    ],
  ),
);
