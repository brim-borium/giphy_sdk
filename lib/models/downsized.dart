import 'package:json_annotation/json_annotation.dart';

part 'downsized.g.dart';

@JsonSerializable()
class Downsized {
  @JsonKey(name: 'frames')
  int frames;
  @JsonKey(name: 'size')
  int size;
  @JsonKey(name: 'url')
  String? url;
  @JsonKey(name: 'height')
  int height;
  @JsonKey(name: 'mediaId')
  String mediaId;
  @JsonKey(name: 'mp4_size')
  int mp4Size;
  @JsonKey(name: 'mp4')
  String? mp4;
  @JsonKey(name: 'renditionType')
  String renditionType;
  @JsonKey(name: 'webp_size')
  int webpSize;
  @JsonKey(name: 'width')
  int width;

  Downsized(
    this.frames,
    this.size,
    this.url,
    this.height,
    this.mediaId,
    this.mp4Size,
    this.mp4,
    this.renditionType,
    this.webpSize,
    this.width,
  );

  factory Downsized.fromJson(Map<String, dynamic> json) =>
      _$DownsizedFromJson(json);

  Map<String, dynamic> toJson() => _$DownsizedToJson(this);
}
