import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_widgets/round_text_avatar.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_serviced_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/domain/user.dart';

class UsersBuilder extends HookConsumerWidget {
  const UsersBuilder({super.key, required this.asyncData});

  final AsyncValue<List<User>> asyncData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authServiceProvider);

    return asyncData.when(
      error: (error, _) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, index) {
          final user = users[index];
          final title = user.displayName;
          final subtitle = user.email;
          final backgroundColor = user.backgroundColor;

          return ListTile(
            leading: RoundTextAvatar(
              label: title,
              background: backgroundColor,
            ),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: IconButton(
              icon: const Icon(Icons.login_rounded),
              onPressed: () async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(child: CircularProgressIndicator()),
                );
                await auth.signIn(user);
              },
            ),
          );
        },
      ),
    );
  }
}
