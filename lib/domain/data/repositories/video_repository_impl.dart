import 'package:dartz/dartz.dart';

import '../../../shared_libraries/common/utils/error/failure_response.dart';
import '../../../shared_libraries/core/pagination/paginated_result.dart';
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
  Future<Either<Failure,  PaginatedResult<ItemVideoEntity>>> getVideos(
      String? pageToken) async {
    try {
      final response = await remoteDataSource.getVideos(pageToken);
      final playlist = videoMapper.mapPlaylistItemListDTOtoEntity(response);
      return Right(PaginatedResult(
        items: playlist.items,
        nextPageToken: playlist.nextPageToken,
      ));
    } catch (error) {
      print('error here $error');
      return Left(Failure(errorMessage: error.toString()));
    }
  }
}
