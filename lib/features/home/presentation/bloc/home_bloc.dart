import 'package:bloc/bloc.dart';
import 'package:jessica_story/shared_libraries/common/utils/state/view_data_state.dart';

import '../../../../domain/domain/entities/youtube_video_entity.dart';
import '../../../../domain/domain/usecases/get_video_usecase.dart';
import '../../../../shared_libraries/common/utils/error/failure_response.dart';
import '../../../../shared_libraries/core/pagination/paginated_result.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetVideoUseCase getVideoUseCase;

  HomeBloc({
    required this.getVideoUseCase,
  }) : super(HomeState(status: ViewStatus.initial())) {
    on<HomeEvent>(_onEvent);
  }

  _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is GetVideo) {
      await getVideos(event.pageToken, emit);
    }
  }

  Future<void> getVideos(String? pageToken, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: ViewStatus.loading()));

    final newState = await getVideoUseCase
        .call( GetVideosParams(pageToken: pageToken))
        .then((value) =>
            value.fold((l) => _failureState(l), (r) => _successState(r)));
    emit(newState);
  }

  HomeState _failureState(Failure failure) {
    return state.copyWith(
      status: ViewStatus.error(msg: 'Failed to load data'),
    );
  }

  HomeState _successState(
    PaginatedResult<ItemVideoEntity> data,
  ) {
    return state.copyWith(
      status: LoadedPaginatedData<ItemVideoEntity>(
          items: data.items, nextPageToken: data.nextPageToken),
    );
  }
}
