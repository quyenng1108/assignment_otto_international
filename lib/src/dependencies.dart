import 'package:assignment_otto_international/src/api_service.dart';
import 'package:assignment_otto_international/src/repository/photo_repository.dart';
import 'package:assignment_otto_international/src/storage/hive_storage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Dependencies {
  static Future<void> registerDependencies() async {
    getIt.registerSingleton<ApiService>(ApiService());
    getIt.registerSingleton<PhotoRepository>(
        PhotoRepository(dio: getIt<ApiService>().dio));
    getIt.registerSingleton<HiveStorage>(HiveStorage());
  }
}
