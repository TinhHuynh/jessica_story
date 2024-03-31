import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:jessica_story/shared_libraries/common/utils/state/view_data_state.dart';

import '../../../../resource/constant/named_routes.dart';
import '../../../../shared_libraries/common/utils/arguments/detail_you_tube_video_argument.dart';
import '../../../../shared_libraries/component/card/card_channel.dart';
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
  void _getVideo(BuildContext context) {
    context.read<HomeBloc>().add(const SearchVideo(query: 'Jesica'));
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
  void initState() {
    super.initState();
    _getVideo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube API Example'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final status = state.statusYouTubeVideo.status;
            if (status.isLoading) {
              return const CircularProgressIndicator();
            } else if (status.isError) {
              return Text(state.statusYouTubeVideo.message);
            } else if (status.isNoData) {
              return Text(state.statusYouTubeVideo.message);
            } else if (status.isHasData) {
              final videos = state.statusYouTubeVideo.data?.items ?? [];
              final channelImageUrl = videos[0].snippet.thumbnails.medium.url;
              final channelTitle = videos[0].snippet.channelTitle;
              return Column(
                children: [
                  CardChannel(
                    channelImageUrl: channelImageUrl,
                    channelTitle: channelTitle,
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,

                          /// Why added -1, because the we hardcoded the first index for channel
                          itemCount: videos.length - 1,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            /// Why added +1, because the we hardcoded the first index for channel
                            final video = videos[index + 1];
                            final youTubeImageUrl =
                                video.snippet.thumbnails.medium.url;
                            final youTubeTitle = video.snippet.title;
                            final youTubeId = video.id.videoId;
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
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
