import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sizeStoreProvider = AutoDisposeStateProviderFamily<Size, String?>(
  (ref, key) => Size.zero,
  name: 'sizeStore',
);