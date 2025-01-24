// core/injection/get_it.dart
import 'dart:developer';

import 'package:furits_control/service/firebase/firebaseDataService.dart';
import 'package:furits_control/service/firebase/auth.dart';
import 'package:furits_control/service/supbace/collection_supbase.dart';
import 'package:get_it/get_it.dart';

import '../../service/supbace/storage_supbase.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  try {
    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
    getIt.registerSingleton<StorageSupbase>(StorageSupbase());
    getIt.registerSingleton<CollectionSupbase>(CollectionSupbase());
    getIt.registerSingleton<FirebaseDataService>(FirebaseDataService());
  } catch (e) {
    log(e.toString());
  }
}
