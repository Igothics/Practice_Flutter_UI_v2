import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pageBucketProvider = Provider<PageStorageBucket>(
  (ref) => PageStorageBucket(),
  name: 'pageBucket',
);//keep it alive!
