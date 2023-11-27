import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sizeStoreProvider = StateProviderFamily<Size, String?>(
  (ref, key) => Size.zero,
  name: 'sizeStore',
);