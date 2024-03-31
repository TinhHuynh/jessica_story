

import 'package:dartz/dartz.dart';

import '../../../shared_libraries/common/utils/error/failure_response.dart';
import '../../../shared_libraries/common/utils/use_case/use_case.dart';
import '../entities/youtube_video_entity.dart';
import '../repositories/video_repository.dart';

class GetVideoUseCase extends UseCase<YouTubeVideoEntity, String> {
  final VideoRepository repository;

  const GetVideoUseCase({required this.repository});

  @override
  Future<Either<FailureResponse, YouTubeVideoEntity>> call(
      String params) async {
    return await repository.searchVideo(params);
  }
}
