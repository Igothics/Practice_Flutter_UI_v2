import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/page_bucket_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';

class StoredListView extends HookConsumerWidget {
  const StoredListView({
    super.key,
    this.listPadding,
    this.itemCount,
    this.direction = Axis.vertical,
    required this.storeKey,
    required this.itemBuilder,
  });
  final String storeKey;
  final EdgeInsets? listPadding;
  final int? itemCount;
  final Axis direction;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final pageBucket = ref.watch(pageBucketProvider);

    return PageStorage(
        bucket: pageBucket,
        child: ListView.builder(
        padding: listPadding,
        key: PageStorageKey<String>('${storeKey}_list-${user?.id}'),
        itemCount: itemCount,
        scrollDirection: direction,
        itemBuilder: itemBuilder,
        ),
    );
  }
}
