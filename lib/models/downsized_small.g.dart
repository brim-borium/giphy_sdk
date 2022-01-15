// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downsized_small.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownsizedSmall _$DownsizedSmallFromJson(Map<String, dynamic> json) =>
    DownsizedSmall(
      json['frames'] as int,
      json['size'] as int,
      json['height'] as int,
      json['mediaId'] as String,
      json['mp4_size'] as int,
      json['mp4'] as String,
      json['renditionType'] as String,
      json['webp_size'] as int,
      json['width'] as int,
    );

Map<String, dynamic> _$DownsizedSmallToJson(DownsizedSmall instance) =>
    <String, dynamic>{
      'frames': instance.frames,
      'size': instance.size,
      'height': instance.height,
      'mediaId': instance.mediaId,
      'mp4_size': instance.mp4Size,
      'mp4': instance.mp4,
      'renditionType': instance.renditionType,
      'webp_size': instance.webpSize,
      'width': instance.width,
    };
