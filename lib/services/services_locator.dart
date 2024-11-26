import 'package:get_it/get_it.dart';
import 'package:hfk_flutter_clone/services/shared_prefs_service.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Register services
  final sharedPreferencesService = await SharedPrefsService.getInstance();
  serviceLocator.registerSingleton(sharedPreferencesService);
}