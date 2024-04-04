import 'package:dartz/dartz.dart';

import '../../../shared_libraries/common/utils/error/failure_response.dart';
import '../../../shared_libraries/core/pagination/paginated_result.dart';
import '../entities/youtube_video_entity.dart';

abstract class VideoRepository {
  const VideoRepository();

  Future<Either<Failure, PaginatedResult<ItemVideoEntity>>> getVideos(String? pageToken);
}
