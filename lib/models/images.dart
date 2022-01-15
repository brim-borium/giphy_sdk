import 'package:json_annotation/json_annotation.dart';

import 'downsized.dart';
import 'fixed_height.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  @JsonKey(name: 'downsized')
  Downsized downsized;
  @JsonKey(name: 'downsized_large')
  Downsized downsizedLarge;
  @JsonKey(name: 'downsized_medium')
  Downsized downsizedMedium;
  @JsonKey(name: 'downsized_small')
  Downsized downsizedSmall;
  @JsonKey(name: 'downsized_still')
  Downsized downsizedStill;
  @JsonKey(name: 'fixed_height')
  FixedHeight fixedHeight;
  @JsonKey(name: 'fixed_height_downsampled')
  FixedHeight fixedHeightDownsampled;
  @JsonKey(name: 'fixed_height_small')
  FixedHeight fixedHeightSmall;
  @JsonKey(name: 'fixed_height_small_still')
  Downsized fixedHeightSmallStill;
  @JsonKey(name: 'fixed_height_still')
  Downsized fixedHeightStill;
  @JsonKey(name: 'fixed_width')
  FixedHeight fixedWidth;
  @JsonKey(name: 'fixed_width_downsampled')
  FixedHeight fixedWidthDownsampled;
  @JsonKey(name: 'fixed_width_small')
  FixedHeight fixedWidthSmall;
  @JsonKey(name: 'fixed_width_small_still')
  Downsized fixedWidthSmallStill;
  @JsonKey(name: 'fixed_width_still')
  Downsized fixedWidthStill;
  @JsonKey(name: 'looping')
  Downsized looping;
  @JsonKey(name: 'mediaId')
  String mediaId;
  @JsonKey(name: 'original')
  FixedHeight original;
  @JsonKey(name: 'original_still')
  Downsized originalStill;
  @JsonKey(name: 'preview')
  Downsized preview;

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
