import 'package:practice_food_delivery/src/features/database/database_provider.dart';
import 'package:practice_food_delivery/src/features/database/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_repository_provider.g.dart';

@riverpod
Future<DatabaseRepository> databaseRepository(DatabaseRepositoryRef ref) async {
// ignore: avoid_manual_providers_as_generated_provider_dependency
  final db = ref.watch(databaseProvider);
  final fakeRepo = DatabaseRepository(db: db.requireValue, ref: ref);
  await fakeRepo.init();
  return fakeRepo;
}