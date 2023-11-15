import 'package:practice_food_delivery/src/database/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_repository_provider.g.dart';

@Riverpod(keepAlive: true)
Future<DatabaseRepository> databaseRepository(DatabaseRepositoryRef ref) async {
  final dataRepo = DatabaseRepository(ref);
  await dataRepo.init();
  return dataRepo;
}