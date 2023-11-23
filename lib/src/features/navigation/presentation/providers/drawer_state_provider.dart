import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/features/navigation/domain/drawer_item.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/providers/destination_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'drawer_state_provider.g.dart';
@riverpod
class DrawerState extends _$DrawerState {
  @override
  DrawerItem build() {
    final firstItem = ref.watch(drawerItemsProvider).first;
    return firstItem;
  }
  // for inside
  List<DrawerItem> _getDrawerItems() => ref.read(drawerItemsProvider);
  void _updateState(int index) => state = _getDrawerItems().elementAt(index);

  // for outside
  Iterable<NavigationDrawerDestination> getDrawerItems() => _getDrawerItems().map((e) => e.destination);
  void updateByLocation(String location){
    final matchedIndex = _getDrawerItems().indexWhere((e) => e.location == location);
    _updateState(matchedIndex > 0 ? matchedIndex : 0);
  }
  String updateAndReturnLocation(int index) {
    _updateState(index);
    return state.location;
  }
  void triggerCallback() => state.onEnter?.call();
}