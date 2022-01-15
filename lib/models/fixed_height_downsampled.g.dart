// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_height_downsampled.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixedHeightDownsampled _$FixedHeightDownsampledFromJson(
        Map<String, dynamic> json) =>
    FixedHeightDownsampled(
      json['frames'] as int,
      json['size'] as int,
      json['url'] as String,
      json['height'] as int,
      json['mediaId'] as String,
      json['mp4_size'] as int,
      json['renditionType'] as String,
      json['webp_size'] as int,
      json['webp'] as String,
      json['width'] as int,
    );

Map<String, dynamic> _$FixedHeightDownsampledToJson(
        FixedHeightDownsampled instance) =>
    <String, dynamic>{
      'frames': instance.frames,
      'size': instance.size,
      'url': instance.url,
      'height': instance.height,
      'mediaId': instance.mediaId,
      'mp4_size': instance.mp4Size,
      'renditionType': instance.renditionType,
      'webp_size': instance.webpSize,
      'webp': instance.webp,
      'width': instance.width,
    };
