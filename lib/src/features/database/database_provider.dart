import 'package:practice_food_delivery/src/features/database/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
part 'database_provider.g.dart';

@riverpod
Future<Database> database(DatabaseRef ref) async {
  final path = ref.watch(pathProvider);
  final db = await databaseFactoryIo.openDatabase('${path.requireValue}fake_db.db');
  return db;
}