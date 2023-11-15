import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/page_bucket_provider.dart';
import 'package:practice_food_delivery/src/features/authentication/application/auth_provider.dart';
import 'package:practice_food_delivery/src/features/home/presentation/user_balance_provider.dart';
import 'package:practice_food_delivery/src/utils/extension.dart';
import 'package:practice_food_delivery/src/utils/utils.dart';

class TransferLogBuilder extends HookConsumerWidget {
  const TransferLogBuilder({super.key, this.padding,});
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).currentUser;
    final pageBucket = ref.watch(pageBucketProvider);
    final userBalance = ref.watch(userBalanceProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: userBalance.when(
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator(),
        data: (data) {
          final transferLog = data.transferLog.reversed.toList();

          return SizedBox(
            height: 728,
            child: PageStorage(
              bucket: pageBucket,
              child: ListView(
                key: PageStorageKey<String>('transfer_list-${user?.id}'),
                children: List.generate(
                  transferLog.length,
                  (index) {
                    final transfer = transferLog[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      child: InkWell(
                      onTapUp: (_) => context.goNamed(
                        'transfer_detail',
                        extra: transfer,
                        pathParameters: {'id': transfer.id.toString()},
                      ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 16.0,
                            backgroundColor: colorScheme.secondaryContainer,
                            child: Text(transfer.id.toString(),),
                          ),
                          title: Text(transfer.transferType.name.toCapitalize()),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$${transfer.amount.toStringAsFixed(2)}',),
                              Text(formatRecordDate(transfer.transferDate,),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
