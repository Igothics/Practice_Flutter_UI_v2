import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'path_provider.g.dart';

@riverpod
Future<String> path(PathRef ref) async {
  final dir = await getApplicationDocumentsDirectory();
  return dir.path;
}