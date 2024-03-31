import 'package:equatable/equatable.dart';

import '../../../../domain/domain/entities/youtube_video_entity.dart';
import '../../../../shared_libraries/common/utils/state/view_data_state.dart';

class HomeState extends Equatable {
  final ViewData<YouTubeVideoEntity> statusYouTubeVideo;

  const HomeState({
    required this.statusYouTubeVideo,
  });

  HomeState copyWith({
    ViewData<YouTubeVideoEntity>? statusYouTubeVideo,
  }) {
    return HomeState(
      statusYouTubeVideo: statusYouTubeVideo ?? this.statusYouTubeVideo,
    );
  }

  @override
  List<Object?> get props => [statusYouTubeVideo];
}
