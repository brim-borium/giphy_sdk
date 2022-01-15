import 'package:json_annotation/json_annotation.dart';

part 'downsized_small.g.dart';

@JsonSerializable()
class DownsizedSmall {
  @JsonKey(name: 'frames')
  int frames;
  @JsonKey(name: 'size')
  int size;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'mediaId')
  String mediaId;
  @JsonKey(name: 'mp4_size')
  int mp4Size;
  @JsonKey(name: 'mp4')
  String mp4;
  @JsonKey(name: 'renditionType')
  String renditionType;
  @JsonKey(name: 'webp_size')
  int webpSize;
  @JsonKey(name: 'width')
  int width;

  DownsizedSmall(
    this.frames,
    this.size,
    this.height,
    this.mediaId,
    this.mp4Size,
    this.mp4,
    this.renditionType,
    this.webpSize,
    this.width,
  );

  factory DownsizedSmall.fromJson(Map<String, dynamic> json) =>
      _$DownsizedSmallFromJson(json);

  Map<String, dynamic> toJson() => _$DownsizedSmallToJson(this);
}
