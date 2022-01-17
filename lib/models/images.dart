import 'package:json_annotation/json_annotation.dart';

import 'image_attributes.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  @JsonKey(name: 'downsized')
  ImageAttributes? downsized;
  @JsonKey(name: 'downsized_large')
  ImageAttributes? downsizedLarge;
  @JsonKey(name: 'downsized_medium')
  ImageAttributes? downsizedMedium;
  @JsonKey(name: 'downsized_small')
  ImageAttributes? downsizedSmall;
  @JsonKey(name: 'downsized_still')
  ImageAttributes? downsizedStill;
  @JsonKey(name: 'fixed_height')
  ImageAttributes? fixedHeight;
  @JsonKey(name: 'fixed_height_downsampled')
  ImageAttributes? fixedHeightDownsampled;
  @JsonKey(name: 'fixed_height_small')
  ImageAttributes? fixedHeightSmall;
  @JsonKey(name: 'fixed_height_small_still')
  ImageAttributes? fixedHeightSmallStill;
  @JsonKey(name: 'fixed_height_still')
  ImageAttributes? fixedHeightStill;
  @JsonKey(name: 'fixed_width')
  ImageAttributes fixedWidth;
  @JsonKey(name: 'fixed_width_downsampled')
  ImageAttributes fixedWidthDownsampled;
  @JsonKey(name: 'fixed_width_small')
  ImageAttributes fixedWidthSmall;
  @JsonKey(name: 'fixed_width_small_still')
  ImageAttributes? fixedWidthSmallStill;
  @JsonKey(name: 'fixed_width_still')
  ImageAttributes? fixedWidthStill;
  @JsonKey(name: 'looping')
  ImageAttributes? looping;
  @JsonKey(name: 'mediaId')
  String mediaId;
  @JsonKey(name: 'original')
  ImageAttributes original;
  @JsonKey(name: 'original_still')
  ImageAttributes? originalStill;
  @JsonKey(name: 'preview')
  ImageAttributes? preview;

  Images(
    this.downsized,
    this.downsizedLarge,
    this.downsizedMedium,
    this.downsizedSmall,
    this.downsizedStill,
    this.fixedHeight,
    this.fixedHeightDownsampled,
    this.fixedHeightSmall,
    this.fixedHeightSmallStill,
    this.fixedHeightStill,
    this.fixedWidth,
    this.fixedWidthDownsampled,
    this.fixedWidthSmall,
    this.fixedWidthSmallStill,
    this.fixedWidthStill,
    this.looping,
    this.mediaId,
    this.original,
    this.originalStill,
    this.preview,
  );

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
