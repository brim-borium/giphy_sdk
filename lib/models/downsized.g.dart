// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downsized.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Downsized _$DownsizedFromJson(Map<String, dynamic> json) => Downsized(
      json['frames'] as int,
      json['size'] as int,
      json['url'] as String,
      json['height'] as int,
      json['mediaId'] as String,
      json['mp4_size'] as int,
      json['renditionType'] as String,
      json['webpSize'] as int,
      json['width'] as int,
    );

Map<String, dynamic> _$DownsizedToJson(Downsized instance) => <String, dynamic>{
      'frames': instance.frames,
      'size': instance.size,
      'url': instance.url,
      'height': instance.height,
      'mediaId': instance.mediaId,
      'mp4_size': instance.mp4Size,
      'renditionType': instance.renditionType,
      'webpSize': instance.webpSize,
      'width': instance.width,
    };
