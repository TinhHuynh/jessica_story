import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jessica_story/domain/domain/entities/youtube_video_entity.dart';
import 'package:jessica_story/shared_libraries/common/utils/state/view_data_state.dart';

import '../../../../resource/constant/named_routes.dart';
import '../../../../shared_libraries/common/utils/arguments/detail_you_tube_video_argument.dart';
import '../../../../shared_libraries/component/card/card_youtube.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PagingController<String?, ItemVideoEntity> _pagingController =
      PagingController(firstPageKey: null);

  void _getVideo(BuildContext context, String? pageToken) {
    context.read<HomeBloc>().add(GetVideo(pageToken: pageToken));
  }

  void _navigateToDetail({
    required BuildContext context,
    required String youTubeTitle,
    required String youTubeId,
  }) {
    Navigator.pushNamed(
      context,
      NamedRoutes.detailYouTubeVideoScreen,
      arguments: DetailYouTubeVideoArgument(
        youTubeTitle: youTubeTitle,
        youTubeId: youTubeId,
      ),
    );
  }

  @override
  initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _getVideo(context, pageKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jessica Story'),
      ),
      body: Center(
        child: BlocConsumer<HomeBloc, HomeState>(
          builder: (context, state) {
            return PagedListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<ItemVideoEntity>(
                itemBuilder: (context, item, index) {
                  final youTubeImageUrl = item.snippet.thumbnails.detail.url;
                  final youTubeTitle = item.snippet.title;
                  final youTubeId = item.id.videoId;
                  return CardYouTube(
                    youTubeImageUrl: youTubeImageUrl,
                    youTubeTitle: youTubeTitle,
                    onPressed: () => _navigateToDetail(
                      context: context,
                      youTubeTitle: youTubeTitle,
                      youTubeId: youTubeId,
                    ),
                  );
                },
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 16,
              ),
            );
          },
          listener: (BuildContext context, HomeState state) {
            final status = state.status;
            if (status is LoadedPaginatedData<ItemVideoEntity>) {
              _pagingController.appendPage(
                status.items,
                status.nextPageToken,
              );
            } else if (status is HasError) {
              _pagingController.error = status;
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
