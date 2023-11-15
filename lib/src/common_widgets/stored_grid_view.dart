import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/page_bucket_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';

class StoredGridView extends HookConsumerWidget {
  const StoredGridView({
    super.key,
    this.gridPadding,
    this.gap,
    this.itemCount,
    this.direction = Axis.vertical,
    required this.storeKey,
    required this.itemBuilder,
  });
  final String storeKey;
  final EdgeInsets? gridPadding;
  final double? gap;
  final int? itemCount;
  final Axis direction;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final pageBucket = ref.watch(pageBucketProvider);

    return Padding(
      padding: gridPadding ?? EdgeInsets.zero,
      child: PageStorage(
        bucket: pageBucket,
        child: CustomScrollView(
          scrollDirection: direction,
          key: PageStorageKey<String>('${storeKey}_grid-${user?.id}'),
          slivers: [
            _buildSpacer(gap ?? 0.0),
            SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: gap ?? 0,
                crossAxisSpacing: gap ?? 0.0,
                crossAxisCount: 2,
              ),
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
            _buildSpacer(gap ?? 0.0),
          ],
        ),
      ),
    );
  }
  Widget _buildSpacer(double height) => SliverToBoxAdapter(child: SizedBox(height: height,),);
}
