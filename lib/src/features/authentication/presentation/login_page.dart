import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/round_text_avatar.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';
import 'package:practice_food_delivery/src/features/authentication/presentation/users_provider.dart';

class LogInPage extends HookConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Login'), centerTitle: true,),
      body: users.when(
        data: (users) => _buildUsersList(users, context, ref),
        error: (error, _) => Center(child: Text('Error: $error'),),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildUsersList(Map<String, User> users, BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, index) {
        final entry = users.entries.elementAt(index);
        final user = entry.value;
        final title = user.displayName;
        final subtitle = user.email;
        final backgroundColor = user.backgroundColor;

        return ListTile(
          leading: RoundTextAvatar(label: title, background: backgroundColor,),
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) =>
                const Center(child: CircularProgressIndicator()),
              );
              await auth.signIn(user);
            },
            icon: const Icon(Icons.login_rounded),
          ),
        );
      },
    );
  }
}
