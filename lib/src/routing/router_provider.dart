import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/global_key_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/presentation/screens/login_page.dart';
import 'package:practice_food_delivery/src/features/cart/presentation/screens/cart_page.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/screens/available_coupons_page.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/widgets/scaffold_with_bottom_navigation_bar.dart';
import 'package:practice_food_delivery/src/features/coupon_box/presentation/screens/unavailable_coupons_page.dart';
import 'package:practice_food_delivery/src/features/favorites/presentation/screens/favorites_page.dart';
import 'package:practice_food_delivery/src/features/home_view/presentation/screens/home_page.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/widgets/scaffold_with_drawer.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/screens/transfer_detail_page.dart';
import 'package:practice_food_delivery/src/features/restaurant_view/presentation/screens/restaurant_page.dart';
import 'package:practice_food_delivery/src/routing/slide_transition_page.dart';
import 'package:practice_food_delivery/src/features/orders_history/presentation/screens/orders_history_page.dart';
import 'package:practice_food_delivery/src/features/payment/presentation/screens/payment_page.dart';
import 'package:practice_food_delivery/src/features/profile/presentation/screens/user_profile_page.dart';
import 'package:practice_food_delivery/src/features/settings/presentation/screens/settings_page.dart';

final routerProvider = AutoDisposeProvider<GoRouter>((ref) {
    //Please ensure that there is only include immutable 1 time created provider except auth, because it's main listenable
    //RouterProvider's re-created will cause big error. It should only be triggered to re-create by its only listenable
    final auth = ref.watch(authServiceProvider);
    final rootNavigatorKey = ref.watch(navigatorStateGlobalKeyProvider('root'));
    final shellDrawerKey = ref.watch(navigatorStateGlobalKeyProvider('shell_drawer'));
    final shellBottomBarKey = ref.watch(navigatorStateGlobalKeyProvider('shell_bottom_bar'));

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
                    child: const RestaurantPage(),
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
              pageBuilder: (_, state, child){
                return SlideTransitionPage(
                  key: state.pageKey,
                  child: ScaffoldWithBottomNavigationBar(child: child,),
                );
              },
              routes: [
                GoRoute(
                  path: '/coupons/available',
                  pageBuilder: (_, state) => SlideTransitionPage(
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
  name: 'router',
);
