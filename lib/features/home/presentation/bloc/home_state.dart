import 'package:equatable/equatable.dart';

import '../../../../domain/domain/entities/youtube_video_entity.dart';
import '../../../../shared_libraries/common/utils/state/view_data_state.dart';

class HomeState extends ViewState with EquatableMixin {
  HomeState({required super.status, this.videos});

  YouTubeVideoEntity? videos;

  HomeState copyWith({
    ViewStatus? status,
    YouTubeVideoEntity? data,
  }) {
    return HomeState(
      status: status ?? this.status,
      videos: data ?? videos,
    );
  }

  @override
  List<Object?> get props => [status, videos];
}
