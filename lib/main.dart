import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/constants/constant_provider.dart';
import 'package:practice_food_delivery/src/features/cart/domain/order.dart';
import 'package:practice_food_delivery/src/features/cart/domain/user_orders.dart';
import 'package:practice_food_delivery/src/features/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/login/domain/user.dart';
import 'package:practice_food_delivery/src/features/login/presentation/users_provider.dart';
import 'package:practice_food_delivery/src/features/menu/domain/menu.dart';
import 'package:practice_food_delivery/src/features/menu/presentation/menu_provider.dart';
import 'package:practice_food_delivery/src/features/restaurants/domain/restaurant.dart';
import 'package:practice_food_delivery/src/features/restaurants/presentation/restaurants_provider.dart';
import 'package:practice_food_delivery/src/features/restaurants/presentation/user_order_provider.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: WarmUp()));
}

class WarmUp extends ConsumerStatefulWidget {
  const WarmUp({super.key});

  @override
  ConsumerState<WarmUp> createState() => _WarmUpState();
}
class _WarmUpState extends ConsumerState<WarmUp> {
  bool warmedUp = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    log('Round ${count++} - warmedUp: $warmedUp');

    if (warmedUp) {
      return const MyApp();
    }

    final dataRepo = ref.watch(databaseRepositoryProvider);
    switch (dataRepo) {
      case AsyncData():
        log('databaseRepository initialized!: $dataRepo');
        Future(() => setState(() => warmedUp = true));
      case AsyncError(): log('databaseRepository error: ${dataRepo.error}');
      default: log('databaseRepository initializing...');
    }

    log('='*30);
    return const Center(child: CircularProgressIndicator(),);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test food shopping App UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,).harmonized(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);
    final restaurants = ref.watch(restaurantsProvider);
    final constant = ref.watch(constantProvider);
    final repository = ref.watch(databaseRepositoryProvider);
    final menuId = constant.getMenusKeys.first;
    final ordersId = constant.getOldOrdersKeys.first;

    final menu = ref.watch(menuProvider(menuId));
    final userOrder = ref.watch(userOrdersProvider(ordersId));


    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping App'),
      ),
      body: userOrder.when(
          data: _buildUserOrdersList,
          error: (error,_) {
            log(error.toString());
            return const SizedBox();
          },
          loading: ()=>const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          const newOrders = <Order>[
            Order(restaurantName: 'resX', foodName: 'food01', date: 'date01', quantity: 1, price: 10.0, totalPrice: 10.0),
            Order(restaurantName: 'resY', foodName: 'food02', date: 'date02', quantity: 2, price: 8.0, totalPrice: 16.0),
          ];
          ref.read(databaseRepositoryProvider).requireValue.addOrders(ordersId, newOrders);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView _buildUsersList(List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        final title = users[index].name;
        final subtitle = users[index].oldOrders;
        return ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        );
      },
    );
  }
  ListView _buildRestaurantsList(List<Restaurant> restaurants) {
    return ListView.builder(
      itemCount: restaurants.length,
      itemBuilder: (_, index) {
        final title = restaurants[index].name;
        final subtitle = restaurants[index].address;
        return ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        );
      },
    );
  }

  ListView _buildMenuList(Menu menu) {
    final foods = menu.foods;
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (_, index) {
        final title = foods[index].name;
        final trailing = foods[index].price;

        return ListTile(
          title: Text(title),
          trailing: Text('\$ $trailing'),
        );
      },
    );
  }

  ListView _buildUserOrdersList(UserOrders userOrder) {
    final orders = userOrder.orders;
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (_, index) {
        final title = '${orders[index].restaurantName} : ${orders[index].foodName}';
        final subtitle = '${orders[index].date} quantity:${orders[index].quantity}';
        final trailing = orders[index].totalPrice;

        return ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Text('\$ $trailing'),
        );
      },
    );
  }

}
