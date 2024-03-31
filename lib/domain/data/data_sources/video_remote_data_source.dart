import 'package:dio/dio.dart';

import '../../../resource/constant/api_constant.dart';
import '../models/youtube_video_dto.dart';

abstract class VideoRemoteDataSource {
  const VideoRemoteDataSource();

  Future<YouTubeVideoDTO> searchVideo(String query);
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  final Dio dio;

  const VideoRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<YouTubeVideoDTO> searchVideo(String query) async {
    try {
      final params = {
        'part': 'snippet',
        'channelId': ApiConstant.channelId,
        'maxResults': 100,
        'q': query,
        'key': ApiConstant.apiKey,
      };

      final response = await dio.get(
        '${ApiConstant.baseUrl}search?',
        queryParameters: params,
      );
      return YouTubeVideoDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
