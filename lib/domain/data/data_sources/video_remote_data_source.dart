import 'package:dio/dio.dart';

import '../../../resource/constant/api_constant.dart';
import '../models/youtube_video_dto.dart';

abstract class VideoRemoteDataSource {
  const VideoRemoteDataSource();

  Future<PlaylistItemListDTO> getVideos(String? pageToken);
}

class VideoRemoteDataSourceImpl extends VideoRemoteDataSource {
  final Dio dio;

  const VideoRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<PlaylistItemListDTO> getVideos(String? pageToken) async {
    try {
      final params = {
        'part': 'snippet',
        'playlistId': ApiConstant.playlistId,
        'maxResults': 20,
        'key': ApiConstant.apiKey,
        'pageToken': pageToken,
      };

      final response = await dio.get(
        '${ApiConstant.baseUrl}playlistItems?',
        queryParameters: params,
      );
      return PlaylistItemListDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
