import 'package:json_annotation/json_annotation.dart';

part 'image_attributes.g.dart';

@JsonSerializable()
class ImageAttributes {
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
  @JsonKey(name: 'webp')
  String? webp;
  @JsonKey(name: 'width')
  int width;

  ImageAttributes(
    this.frames,
    this.size,
    this.url,
    this.height,
    this.mediaId,
    this.mp4Size,
    this.mp4,
    this.renditionType,
    this.webpSize,
    this.webp,
    this.width,
  );

  factory ImageAttributes.fromJson(Map<String, dynamic> json) =>
      _$ImageAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAttributesToJson(this);
}
