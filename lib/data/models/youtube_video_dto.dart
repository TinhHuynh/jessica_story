class PlaylistItemListDTO {
  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final List<PlaylistItemDTO>? items;
  final PageInfoDTO? pageInfo;

  PlaylistItemListDTO({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.items,
    this.pageInfo,
  });

  factory PlaylistItemListDTO.fromJson(Map<String, dynamic> json) {
    return PlaylistItemListDTO(
      kind: json['kind'],
      etag: json['etag'],
      nextPageToken: json['nextPageToken'],
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => PlaylistItemDTO.fromJson(item))
          .toList(),
      pageInfo: json['pageInfo'] != null
          ? PageInfoDTO.fromJson(json['pageInfo'])
          : null,
    );
  }
}

class PlaylistItemDTO {
  final String? kind;
  final String? etag;
  final String? id;
  final SnippetDTO? snippet;

  PlaylistItemDTO({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  factory PlaylistItemDTO.fromJson(Map<String, dynamic> json) {
    return PlaylistItemDTO(
      kind: json['kind'],
      etag: json['etag'],
      id: json['id'],
      snippet:
          json['snippet'] != null ? SnippetDTO.fromJson(json['snippet']) : null,
    );
  }
}

class SnippetDTO {
  final String? publishedAt;
  final String? channelId;
  final String? title;
  final String? description;
  final ThumbnailsDTO? thumbnails;
  final String? channelTitle;
  final String? playlistId;
  final int? position;
  final ResourceIdDTO? resourceId;
  final String? videoOwnerChannelTitle;
  final String? videoOwnerChannelId;

  SnippetDTO({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.playlistId,
    this.position,
    this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  factory SnippetDTO.fromJson(Map<String, dynamic> json) {
    return SnippetDTO(
      publishedAt: json['publishedAt'],
      channelId: json['channelId'],
      title: json['title'],
      description: json['description'],
      thumbnails: json['thumbnails'] != null
          ? ThumbnailsDTO.fromJson(json['thumbnails'])
          : null,
      channelTitle: json['channelTitle'],
      playlistId: json['playlistId'],
      position: json['position'],
      resourceId: json['resourceId'] != null
          ? ResourceIdDTO.fromJson(json['resourceId'])
          : null,
      videoOwnerChannelTitle: json['videoOwnerChannelTitle'],
      videoOwnerChannelId: json['videoOwnerChannelId'],
    );
  }
}

class ThumbnailsDTO {
  final ThumbnailDetailDTO? defaultThumbnail;
  final ThumbnailDetailDTO? medium;
  final ThumbnailDetailDTO? high;
  final ThumbnailDetailDTO? standard;
  final ThumbnailDetailDTO? maxres;

  ThumbnailsDTO({
    this.defaultThumbnail,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  factory ThumbnailsDTO.fromJson(Map<String, dynamic> json) {
    return ThumbnailsDTO(
      defaultThumbnail: json['default'] != null
          ? ThumbnailDetailDTO.fromJson(json['default'])
          : null,
      medium: json['medium'] != null
          ? ThumbnailDetailDTO.fromJson(json['medium'])
          : null,
      high: json['high'] != null
          ? ThumbnailDetailDTO.fromJson(json['high'])
          : null,
      standard: json['standard'] != null
          ? ThumbnailDetailDTO.fromJson(json['standard'])
          : null,
      maxres: json['maxres'] != null
          ? ThumbnailDetailDTO.fromJson(json['maxres'])
          : null,
    );
  }
}

class ThumbnailDetailDTO {
  final String? url;
  final int? width;
  final int? height;

  ThumbnailDetailDTO({this.url, this.width, this.height});

  factory ThumbnailDetailDTO.fromJson(Map<String, dynamic> json) {
    return ThumbnailDetailDTO(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}

class ResourceIdDTO {
  final String? kind;
  final String? videoId;

  ResourceIdDTO({
    this.kind,
    this.videoId,
  });

  factory ResourceIdDTO.fromJson(Map<String, dynamic> json) {
    return ResourceIdDTO(
      kind: json['kind'],
      videoId: json['videoId'],
    );
  }
}

class PageInfoDTO {
  final int? totalResults;
  final int? resultsPerPage;

  PageInfoDTO({
    this.totalResults,
    this.resultsPerPage,
  });

  factory PageInfoDTO.fromJson(Map<String, dynamic> json) {
    return PageInfoDTO(
      totalResults: json['totalResults'],
      resultsPerPage: json['resultsPerPage'],
    );
  }
}
