import 'package:practice_food_delivery/src/features/database/database_repository.dart';
import 'package:practice_food_delivery/src/features/database/database_repository_provider.dart';
import 'package:practice_food_delivery/src/features/menu/domain/menu.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'menu_provider.g.dart';

@riverpod
Future<Menu> menu(MenuRef ref, String id) async {
  final database = ref.watch(databaseRepositoryProvider);
  return database.requireValue.getMenuByID(id);
}
