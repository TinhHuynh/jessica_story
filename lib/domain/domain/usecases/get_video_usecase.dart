import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jessica_story/shared_libraries/core/pagination/paginated_result.dart';

import '../../../shared_libraries/common/utils/error/failure_response.dart';
import '../../../shared_libraries/common/utils/use_case/use_case.dart';
import '../entities/youtube_video_entity.dart';
import '../repositories/video_repository.dart';

class GetVideoUseCase extends UseCase<PaginatedResult<ItemVideoEntity>, GetVideosParams> {
  final VideoRepository repository;

  const GetVideoUseCase({required this.repository});

  @override
  Future<Either<Failure, PaginatedResult<ItemVideoEntity>>> call(GetVideosParams params) async {
    return await repository.getVideos(params.pageToken);
  }
}

class GetVideosParams extends Equatable {
  final String? pageToken;

  const GetVideosParams({this.pageToken});

  @override
  List<Object?> get props => [pageToken];
}
