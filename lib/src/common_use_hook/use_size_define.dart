import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/common_provider/size_store_provider.dart';

Size useSizeDefine(
  WidgetRef ref, {
  required GlobalKey targetGlobalKey,
  required String targetStringKey,
  EdgeInsets? margin,
  List<Object?>? keys,
}) {
  final controller = ref.read(sizeStoreProvider(targetStringKey).notifier);

  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final renderObject = targetGlobalKey.currentContext?.findRenderObject();
        if (renderObject != null) {
          final renderBox = renderObject as RenderBox;
          controller.update((state) {
            final horizontalMargin = margin == null ? 0.0 : margin.left + margin.right;
            final verticalMargin = margin == null ? 0.0 : margin.top + margin.bottom;

            // log('[useSizeDefine "$targetStringKey"]: ${renderBox.size.height - verticalMargin}');
            return Size(renderBox.size.width - horizontalMargin, renderBox.size.height - verticalMargin);
          });
        } else {
          // log('[useSizeDefine "$targetStringKey"]: null!');
        }
      },
    );
    return null;
  }, [...?keys]);
  return ref.watch(sizeStoreProvider(targetStringKey));
}
