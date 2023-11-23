import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_item.freezed.dart';

@freezed
class DrawerItem with _$DrawerItem {
  const factory DrawerItem({
    @Default(0) int id,
    required String title,
    required String location,
    required NavigationDrawerDestination destination,
    VoidCallback? onEnter,
  }) = _DrawerItem;
}