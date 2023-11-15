import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Size useRenderBoxSize(GlobalKey key, String? trackKey) {
  return use(RenderBoxSize(key, trackKey));
}

class RenderBoxSize extends Hook<Size> {
  const RenderBoxSize(this.inputKey, this.trackKey);

  final GlobalKey inputKey;
  final String? trackKey;
  @override
  HookState<Size, RenderBoxSize> createState() => _RenderBoxSizeState();
}

class _RenderBoxSizeState extends HookState<Size, RenderBoxSize> {
  Size size = Size.zero;

  @override
  void initHook() {
    super.initHook();
    WidgetsBinding.instance.addPostFrameCallback((_) {
        final renderObject = hook.inputKey.currentContext?.findRenderObject();
        if (renderObject != null) {
          final renderBox = renderObject as RenderBox;
          setState(() => size = renderBox.size);
          log('[useRenderBoxSize "${hook.trackKey}"]: ${renderBox.size}');
        } else {
          log('[useRenderBoxSize "${hook.trackKey}"]: null!');
        }
      },
    );
  }

  @override
  Size build(BuildContext context) {
    return size;
  }
}
