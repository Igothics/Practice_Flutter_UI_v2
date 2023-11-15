import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/presentation/login_page.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/cart_page.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/available_coupons_page.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/scaffold_with_bottom_navigation_bar.dart';
import 'package:practice_food_delivery/src/features/coupons/presentation/unavailable_coupons_page.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/favorites_page.dart';
import 'package:practice_food_delivery/src/features/home/presentation/home_page.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/scaffold_with_drawer.dart';
import 'package:practice_food_delivery/src/features/restaurants/presentation/restaurant_page.dart';
import 'package:practice_food_delivery/src/routing/slide_transition_page.dart';
import 'package:practice_food_delivery/src/features/orders_history/presentation/orders_history_page.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/payment_page.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/transfer_detail_page.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/user_profile_page.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/settings_page.dart';
import 'package:practice_food_delivery/src/utils/test_color_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
    //Please ensure that there is only include immutable 1 time created provider except auth, because it's main listenable
    //RouterProvider's re-created will cause big error. It should only be triggered to re-create by its only listenable
    final auth = ref.watch(authProvider);
    final rootNavigatorKey = ref.watch(globalKeyNavigatorStateProvider('root'));
    final shellDrawerKey = ref.watch(globalKeyNavigatorStateProvider('shell_drawer'));
    final shellBottomBarKey = ref.watch(globalKeyNavigatorStateProvider('shell_bottom_bar'));
    log('[Router provider]: initial or reset by auth');

    return GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/home',
      // initialLocation: '/test_color',
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, state) {
            // return '/test_color';
            return '/home';
          },
        ),
        ShellRoute(
          navigatorKey: shellDrawerKey,
          builder: (_, __, child) {
            return ScaffoldWithDrawer(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (_, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const HomePage(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: 'restaurants/:resId',
                  pageBuilder: (_, state) => SlideTransitionPage(
                    key: state.pageKey,
                    offset: const Offset(0.0, 0.5),
                    child: RestaurantPage(id: state.pathParameters['resId']!),
                  ),
                ),
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: 'cart',
                  pageBuilder: (_, state) => SlideTransitionPage(
                    key: state.pageKey,
                    child: const CartPage(),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: '/payment',
              name: 'payment',
              pageBuilder: (_, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const PaymentPage(),
              ),
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  path: 'transfer_:id',
                  name: 'transfer_detail',
                  builder: (_, __) => const TransferDetailPage(),
                ),
              ],
            ),
            GoRoute(
              path: '/orders_history',
              pageBuilder: (_, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const OrdersHistory(),
              ),
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (_, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const SettingsPage(),
              ),
            ),
            GoRoute(
              path: '/favorites',
              pageBuilder: (_, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const FavoritesPage(),
              ),
            ),
            GoRoute(
              path: '/user_profile',
              pageBuilder: (_, state) => SlideTransitionPage(
                key: state.pageKey,
                child: const UserProfilePage(),
              ),
            ),
            ShellRoute(
              navigatorKey: shellBottomBarKey,
              builder: (_, __, child){
                return ScaffoldWithBottomNavigationBar(
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: '/coupons/available',
                  pageBuilder: (_, state) => SlideTransitionPage(
                    offset: const Offset(-1.0, 0.0),
                    key: state.pageKey,
                    child: const AvailableCouponsPage(),
                  ),
                ),
                GoRoute(
                  path: '/coupons/unavailable',
                  pageBuilder: (_, state) => SlideTransitionPage(
                    key: state.pageKey,
                    child: const UnavailableCouponsPage(),
                  ),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          pageBuilder: (_, state) => SlideTransitionPage(
            key: state.pageKey,
            child: const LogInPage(),
          ),
        ),
        GoRoute(
          path: '/test_color',
          pageBuilder: (_, state) => SlideTransitionPage(
            key: state.pageKey,
            child: const TestColorPage(),
          ),
        ),
      ],
      redirect: (_, state) {
        final loggedIn = auth.loggedIn;
        if (!loggedIn) {
          return '/login';
        }
        return null;
      },
      refreshListenable: auth,
    );
  },
);
