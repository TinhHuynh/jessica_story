import 'package:equatable/equatable.dart';

class PlaylistEntity extends Equatable {
  const PlaylistEntity({
    required this.kind,
    required this.etag,
    required this.items,
    this.nextPageToken,
  });

  final String kind;
  final String etag;
  final List<ItemVideoEntity> items;

  final String? nextPageToken;

  @override
  List<Object?> get props => [kind, etag, items, nextPageToken];
}

class ItemVideoEntity extends Equatable {
  const ItemVideoEntity({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  final String kind;
  final String etag;
  final IdVideoEntity id;
  final SnippetVideoEntity snippet;

  @override
  List<Object> get props => [kind, etag, id, snippet];
}

class IdVideoEntity extends Equatable {
  const IdVideoEntity({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  @override
  List<Object> get props => [kind, videoId];
}

class SnippetVideoEntity extends Equatable {
  const SnippetVideoEntity({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.publishTime,
  });

  final String publishedAt;
  final String channelId;
  final String title;
  final String description;
  final ThumbnailsVideoEntity thumbnails;
  final String channelTitle;
  final String publishTime;

  @override
  List<Object> get props => [
        publishedAt,
        channelId,
        title,
        description,
        thumbnails,
        channelTitle,
        publishTime,
      ];
}

class ThumbnailsVideoEntity extends Equatable {
  const ThumbnailsVideoEntity({
    required this.detail,
  });

  factory ThumbnailsVideoEntity.unavailable() =>
      ThumbnailsVideoEntity(detail: ThumbnailDetailEntity.unavailable());

  final ThumbnailDetailEntity detail;

  @override
  List<Object> get props => [detail];
}

class ThumbnailDetailEntity extends Equatable {
  const ThumbnailDetailEntity({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ThumbnailDetailEntity.unavailable() =>
      const ThumbnailDetailEntity(url: 'https://i0.wp.com/pambos.wine/wp-content/plugins/elementor/assets/images/placeholder.png?w=640&ssl=1', width: 0, height: 0);

  final String url;
  final int width;
  final int height;

  @override
  List<Object> get props => [url, width, height];
}
