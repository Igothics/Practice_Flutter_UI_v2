import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Size useSizeDefine(StateController<Size> notifier, {required GlobalKey targetKey, String? trackKey}){
  useEffect(() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderObject = targetKey.currentContext?.findRenderObject();
      if (renderObject != null) {
        final renderBox = renderObject as RenderBox;
        notifier.update((state) {
          log('[useSizeDefine "$trackKey"]: ${renderBox.size.height}');
          return renderBox.size;
        });
      } else {
        log('[useSizeDefine "$trackKey"]: null!');
      }
    },);
    return null;
  }, []);
  return notifier.state;
}
