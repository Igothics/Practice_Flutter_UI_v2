import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/features/authentication/presentation/providers/users_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/presentation/widgets/users_builder.dart';

class LogInPage extends HookConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: UsersBuilder(asyncData: users,),
    );
  }
}
