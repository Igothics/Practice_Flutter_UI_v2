import 'package:flutter/material.dart';
import 'package:practice_food_delivery/src/features/navigation/domain/navigation_drawer_item.dart';
import 'package:practice_food_delivery/src/features/navigation/presentation/destination_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'drawer_state_provider.g.dart';
@riverpod
class DrawerState extends _$DrawerState {
  @override
  NavigationDrawerItem build() {
    final firstItem = ref.watch(destinationItemsProvider).first;
    return firstItem;
  }
  // for inside
  List<NavigationDrawerItem> _getNavigationDrawerItems() => ref.read(destinationItemsProvider);
  void _updateState(int index) => state = _getNavigationDrawerItems().elementAt(index);

  // for outside
  Iterable<NavigationDrawerDestination> getDrawerDestinations() => _getNavigationDrawerItems().map((e) => e.destination);
  void updateByLocation(String location){
    final matchedIndex = _getNavigationDrawerItems().indexWhere((e) => e.location == location);
    _updateState(matchedIndex > 0 ? matchedIndex : 0);
  }
  String updateAndReturnLocation(int index) {
    _updateState(index);
    return state.location;
  }
  void triggerCallback() => state.onEnter?.call();
}