import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final autoDisposeSizeProvider = AutoDisposeStateProviderFamily<Size, String>((ref, key) => Size.zero);
final alwaysAliveSizeProvider = StateProvider((ref) => Size.zero);
