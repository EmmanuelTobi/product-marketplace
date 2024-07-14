import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marketplace/services/auth_service.dart';
import 'package:marketplace/services/persistence_service.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:marketplace/services/user_service.dart';

final GetIt serviceLocator = GetIt.I;

Future locatorSetup() async {

  //Future<PackageInfo> packageInfo() async => await PackageInfo.fromPlatform();

  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator.registerLazySingleton(() => PersistenceService());
  serviceLocator.registerLazySingleton(() => UserService());
  serviceLocator.registerLazySingleton(() => AuthService());
  serviceLocator.registerLazySingleton(() => ProductService());

}
