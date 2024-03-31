import 'package:dartz/dartz.dart';

import '../../../shared_libraries/common/utils/error/failure_response.dart';
import '../../domain/entities/youtube_video_entity.dart';
import '../../domain/repositories/video_repository.dart';
import '../data_sources/video_remote_data_source.dart';
import '../mappers/video_mapper.dart';

class VideoRepositoryImpl extends VideoRepository {
  final VideoRemoteDataSource remoteDataSource;
  final VideoMapper videoMapper;

  const VideoRepositoryImpl({
    required this.remoteDataSource,
    required this.videoMapper,
  });

  @override
  Future<Either<FailureResponse, YouTubeVideoEntity>> searchVideo(
      String query) async {
    try {
      final response = await remoteDataSource.searchVideo(query);
      return Right(videoMapper.mapYouTubeVideoDTOtoEntity(response));
    } on Exception catch (error) {
      return Left(FailureResponse(errorMessage: error.toString()));
    }
  }
}
