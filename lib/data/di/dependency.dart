

import '../../data/data_sources/video_remote_data_source.dart';
import '../../data/mappers/video_mapper.dart';
import '../../data/repositories/video_repository_impl.dart';
import '../../domain/repositories/video_repository.dart';
import '../../domain/usecases/get_video_usecase.dart';
import '../../shared_libraries/dependencies/get_it/get_it.dart';

class RegisterVideoModule {
  RegisterVideoModule() {
    _registerMapper();
    _registerCore();
  }

  void _registerMapper() {
    sl.registerLazySingleton<VideoMapper>(() => const VideoMapper());
  }

  void _registerCore() {
    /// remote
    sl.registerLazySingleton<VideoRemoteDataSource>(
        () => VideoRemoteDataSourceImpl(
              dio: sl(),
            ));

    /// repository
    sl.registerLazySingleton<VideoRepository>(() => VideoRepositoryImpl(
          remoteDataSource: sl(),
          videoMapper: sl(),
        ));

    /// use case
    sl.registerLazySingleton<GetVideoUseCase>(() => GetVideoUseCase(
          repository: sl(),
        ));
  }
}
