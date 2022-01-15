import 'package:json_annotation/json_annotation.dart';

part 'fixed_height_downsampled.g.dart';

@JsonSerializable()
class FixedHeightDownsampled {
  @JsonKey(name: 'frames')
  int frames;
  @JsonKey(name: 'size')
  int size;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'mediaId')
  String mediaId;
  @JsonKey(name: 'mp4_size')
  int mp4Size;
  @JsonKey(name: 'renditionType')
  String renditionType;
  @JsonKey(name: 'webp_size')
  int webpSize;
  @JsonKey(name: 'webp')
  String webp;
  @JsonKey(name: 'width')
  int width;

  FixedHeightDownsampled(
    this.frames,
    this.size,
    this.url,
    this.height,
    this.mediaId,
    this.mp4Size,
    this.renditionType,
    this.webpSize,
    this.webp,
    this.width,
  );

  factory FixedHeightDownsampled.fromJson(Map<String, dynamic> json) =>
      _$FixedHeightDownsampledFromJson(json);

  Map<String, dynamic> toJson() => _$FixedHeightDownsampledToJson(this);
}
