import 'package:dartz/dartz.dart';

import '../../../shared_libraries/common/utils/error/failure.dart';
import '../../domain/entities/youtube_video_entity.dart';
import '../../domain/repositories/video_repository.dart';
import '../../shared_libraries/common/utils/pagination/paginated_result.dart';
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
      return Left(Failure(errorMessage: error.toString()));
    }
  }
}
