import 'package:giphy_sdk/models/user.dart';
import 'package:giphy_sdk/models/user_dictionary.dart';
import 'package:json_annotation/json_annotation.dart';

import 'images.dart';

part 'giphy_media.g.dart';

@JsonSerializable()
class GiphyMedia {
  @JsonKey(name: 'analytics_response_payload')
  String analyticsResponsePayload;
  @JsonKey(name: 'bitly_gif_url')
  String bitlyGifUrl;
  @JsonKey(name: 'bitly_url')
  String bitlyUrl;
  @JsonKey(name: 'content_url')
  String contentUrl;
  @JsonKey(name: 'embed_url')
  String embedUrl;
  @JsonKey(name: 'has_attribution')
  bool hasAttribution;
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'images')
  Images images;
  @JsonKey(name: 'import_datetime')
  String importDatetime;
  @JsonKey(name: 'is_anonymous')
  bool isAnonymous;
  @JsonKey(name: 'is_community')
  bool isCommunity;
  @JsonKey(name: 'is_dynamic')
  bool isDynamic;
  @JsonKey(name: 'is_featured')
  bool isFeatured;
  @JsonKey(name: 'is_hidden')
  bool isHidden;
  @JsonKey(name: 'is_indexable')
  bool isIndexable;
  @JsonKey(name: 'is_realtime')
  bool isRealtime;
  @JsonKey(name: 'is_removed')
  bool isRemoved;
  @JsonKey(name: 'is_sticker')
  bool isSticker;
  @JsonKey(name: 'rating')
  String rating;
  @JsonKey(name: 'slug')
  String slug;
  @JsonKey(name: 'source')
  String source;
  @JsonKey(name: 'source_post_url')
  String sourcePostUrl;
  @JsonKey(name: 'source_tld')
  String sourceTld;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'trending_datetime')
  String trendingDatetime;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'userDictionary')
  UserDictionary userDictionary;

  GiphyMedia(
    this.analyticsResponsePayload,
    this.bitlyGifUrl,
    this.bitlyUrl,
    this.contentUrl,
    this.embedUrl,
    this.hasAttribution,
    this.id,
    this.images,
    this.importDatetime,
    this.isAnonymous,
    this.isCommunity,
    this.isDynamic,
    this.isFeatured,
    this.isHidden,
    this.isIndexable,
    this.isRealtime,
    this.isRemoved,
    this.isSticker,
    this.rating,
    this.slug,
    this.source,
    this.sourcePostUrl,
    this.sourceTld,
    this.title,
    this.trendingDatetime,
    this.type,
    this.url,
    this.user,
    this.userDictionary,
  );

  factory GiphyMedia.fromJson(Map<String, dynamic> json) =>
      _$GiphyMediaFromJson(json);

  Map<String, dynamic> toJson() => _$GiphyMediaToJson(this);
}
