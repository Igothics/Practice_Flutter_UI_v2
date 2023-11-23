import 'package:practice_food_delivery/src/database/fake_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_database_provider.g.dart';

@riverpod
Future<FakeDatabase> fakeDatabase(FakeDatabaseRef ref) async {
  final dataRepo = FakeDatabase(ref);
  await dataRepo.init();
  return dataRepo;
}