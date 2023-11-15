import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_drawer_item.freezed.dart';

@freezed
class NavigationDrawerItem with _$NavigationDrawerItem {
  const factory NavigationDrawerItem({
    @Default(0) int id,
    required String title,
    required String location,
    required NavigationDrawerDestination destination,
    VoidCallback? onEnter,
  }) = _NavigationDrawerItem;
}