// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      json['downsized'] == null
          ? null
          : ImageAttributes.fromJson(json['downsized'] as Map<String, dynamic>),
      json['downsized_large'] == null
          ? null
          : ImageAttributes.fromJson(
              json['downsized_large'] as Map<String, dynamic>),
      json['downsized_medium'] == null
          ? null
          : ImageAttributes.fromJson(
              json['downsized_medium'] as Map<String, dynamic>),
      json['downsized_small'] == null
          ? null
          : ImageAttributes.fromJson(
              json['downsized_small'] as Map<String, dynamic>),
      json['downsized_still'] == null
          ? null
          : ImageAttributes.fromJson(
              json['downsized_still'] as Map<String, dynamic>),
      json['fixed_height'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_height'] as Map<String, dynamic>),
      json['fixed_height_downsampled'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_height_downsampled'] as Map<String, dynamic>),
      json['fixed_height_small'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_height_small'] as Map<String, dynamic>),
      json['fixed_height_small_still'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_height_small_still'] as Map<String, dynamic>),
      json['fixed_height_still'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_height_still'] as Map<String, dynamic>),
      ImageAttributes.fromJson(json['fixed_width'] as Map<String, dynamic>),
      ImageAttributes.fromJson(
          json['fixed_width_downsampled'] as Map<String, dynamic>),
      ImageAttributes.fromJson(
          json['fixed_width_small'] as Map<String, dynamic>),
      json['fixed_width_small_still'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_width_small_still'] as Map<String, dynamic>),
      json['fixed_width_still'] == null
          ? null
          : ImageAttributes.fromJson(
              json['fixed_width_still'] as Map<String, dynamic>),
      json['looping'] == null
          ? null
          : ImageAttributes.fromJson(json['looping'] as Map<String, dynamic>),
      json['mediaId'] as String,
      ImageAttributes.fromJson(json['original'] as Map<String, dynamic>),
      json['original_still'] == null
          ? null
          : ImageAttributes.fromJson(
              json['original_still'] as Map<String, dynamic>),
      json['preview'] == null
          ? null
          : ImageAttributes.fromJson(json['preview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'downsized': instance.downsized,
      'downsized_large': instance.downsizedLarge,
      'downsized_medium': instance.downsizedMedium,
      'downsized_small': instance.downsizedSmall,
      'downsized_still': instance.downsizedStill,
      'fixed_height': instance.fixedHeight,
      'fixed_height_downsampled': instance.fixedHeightDownsampled,
      'fixed_height_small': instance.fixedHeightSmall,
      'fixed_height_small_still': instance.fixedHeightSmallStill,
      'fixed_height_still': instance.fixedHeightStill,
      'fixed_width': instance.fixedWidth,
      'fixed_width_downsampled': instance.fixedWidthDownsampled,
      'fixed_width_small': instance.fixedWidthSmall,
      'fixed_width_small_still': instance.fixedWidthSmallStill,
      'fixed_width_still': instance.fixedWidthStill,
      'looping': instance.looping,
      'mediaId': instance.mediaId,
      'original': instance.original,
      'original_still': instance.originalStill,
      'preview': instance.preview,
    };
