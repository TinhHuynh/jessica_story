
import 'package:dio/dio.dart';

import '../../dependencies/get_it/get_it.dart';
import '../network/dio_handler.dart';

class RegisterCoreModule {
  RegisterCoreModule() {
    _registerCore();
  }

  void _registerCore() {
    sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    sl.registerLazySingleton<DioHandler>(() => DioHandler(
          apiBaseUrl: 'https://jsonplaceholder.typicode.com',
        ));
  }
}
