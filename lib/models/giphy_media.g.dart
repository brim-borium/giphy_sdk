// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphyMedia _$GiphyMediaFromJson(Map<String, dynamic> json) => GiphyMedia(
      json['analytics_response_payload'] as String,
      json['bitly_gif_url'] as String?,
      json['bitly_url'] as String?,
      json['content_url'] as String?,
      json['embed_url'] as String?,
      json['has_attribution'] as bool,
      json['id'] as String,
      Images.fromJson(json['images'] as Map<String, dynamic>),
      json['import_datetime'] as String?,
      json['is_anonymous'] as bool,
      json['is_community'] as bool,
      json['is_dynamic'] as bool,
      json['is_featured'] as bool,
      json['is_hidden'] as bool,
      json['is_indexable'] as bool,
      json['is_realtime'] as bool,
      json['is_removed'] as bool,
      json['is_sticker'] as bool,
      json['rating'] as String?,
      json['slug'] as String?,
      json['source'] as String?,
      json['source_post_url'] as String?,
      json['source_tld'] as String?,
      json['title'] as String,
      json['trending_datetime'] as String?,
      json['type'] as String,
      json['url'] as String,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      UserDictionary.fromJson(json['userDictionary'] as Map<String, dynamic>),
    )..animatedTextStyle = json['animated_text_style'] as String?;

Map<String, dynamic> _$GiphyMediaToJson(GiphyMedia instance) =>
    <String, dynamic>{
      'analytics_response_payload': instance.analyticsResponsePayload,
      'animated_text_style': instance.animatedTextStyle,
      'bitly_gif_url': instance.bitlyGifUrl,
      'bitly_url': instance.bitlyUrl,
      'content_url': instance.contentUrl,
      'embed_url': instance.embedUrl,
      'has_attribution': instance.hasAttribution,
      'id': instance.id,
      'images': instance.images,
      'import_datetime': instance.importDatetime,
      'is_anonymous': instance.isAnonymous,
      'is_community': instance.isCommunity,
      'is_dynamic': instance.isDynamic,
      'is_featured': instance.isFeatured,
      'is_hidden': instance.isHidden,
      'is_indexable': instance.isIndexable,
      'is_realtime': instance.isRealtime,
      'is_removed': instance.isRemoved,
      'is_sticker': instance.isSticker,
      'rating': instance.rating,
      'slug': instance.slug,
      'source': instance.source,
      'source_post_url': instance.sourcePostUrl,
      'source_tld': instance.sourceTld,
      'title': instance.title,
      'trending_datetime': instance.trendingDatetime,
      'type': instance.type,
      'url': instance.url,
      'user': instance.user,
      'userDictionary': instance.userDictionary,
    };
