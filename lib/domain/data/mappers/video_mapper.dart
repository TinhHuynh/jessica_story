import '../../domain/entities/youtube_video_entity.dart';
import '../models/youtube_video_dto.dart';

class VideoMapper {
  const VideoMapper();

  PlaylistEntity mapPlaylistItemListDTOtoEntity(PlaylistItemListDTO? dto) {
    return PlaylistEntity(
      kind: dto?.kind ?? '',
      etag: dto?.etag ?? '',
      items: dto?.items?.map(mapPlaylistItemDTOtoEntity).toList() ?? [],
      nextPageToken: dto?.nextPageToken,
    );
  }

  ItemVideoEntity mapPlaylistItemDTOtoEntity(PlaylistItemDTO dto) {
    if (dto.snippet == null) {
      throw Exception('Snippet is null');
    }
    if (dto.snippet?.resourceId == null) {
      throw Exception('Resource id is null');
    }
    return ItemVideoEntity(
      kind: dto.kind ?? '',
      etag: dto.etag ?? '',
      id: mapIdVideoDTOtoEntity(dto.snippet!.resourceId!),
      snippet: mapSnippetVideoDTOtoEntity(dto.snippet!),
    );
  }

  IdVideoEntity mapIdVideoDTOtoEntity(ResourceIdDTO dto) {
    return IdVideoEntity(kind: dto.kind ?? '', videoId: dto.videoId ?? '');
  }

  SnippetVideoEntity mapSnippetVideoDTOtoEntity(SnippetDTO dto) {
    if (dto.thumbnails == null) {
      throw Exception('Thumbnails is null');
    }
    return SnippetVideoEntity(
      publishedAt: dto.publishedAt ?? '',
      channelId: dto.channelId ?? '',
      title: dto.title ?? '',
      description: dto.description ?? '',
      thumbnails: mapThumbnailsVideoDTOtoEntity(dto.thumbnails!),
      channelTitle: dto.channelTitle ?? '',
      publishTime: dto.publishedAt ?? '',
    );
  }

  ThumbnailsVideoEntity mapThumbnailsVideoDTOtoEntity(ThumbnailsDTO dto) {
    final thumbnail = [
      dto.medium,
      dto.high,
      dto.standard,
      dto.maxres,
      dto.defaultThumbnail
    ].firstOrNull;
    if (thumbnail == null) {
      return ThumbnailsVideoEntity.unavailable();
    }
    return ThumbnailsVideoEntity(
        detail: mapMediumVideoDTOtoEntity(dto.medium!));
  }

  ThumbnailDetailEntity mapMediumVideoDTOtoEntity(ThumbnailDetailDTO dto) {
    return ThumbnailDetailEntity(
      url: dto.url ?? '',
      width: dto.width ?? 0,
      height: dto.height ?? 0,
    );
  }
}
