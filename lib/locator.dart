
import 'package:get_it/get_it.dart';
import 'package:plant_ui_522/UserController.dart';
import 'package:plant_ui_522/auth_servcie.dart';

final locator = GetIt.instance;

// create and manage singleton.
void setup() {
  locator.registerLazySingleton<AuthenticationServices>(
      () => AuthenticationServices());
  locator.registerLazySingleton<UserController>(() => UserController());
}
