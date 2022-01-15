import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'banner_url')
  String bannerUrl;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'display_name')
  String displayName;
  @JsonKey(name: 'instagram_url')
  String instagramUrl;
  @JsonKey(name: 'is_public')
  bool isPublic;
  @JsonKey(name: 'is_staff')
  bool isStaff;
  @JsonKey(name: 'suppress_chrome')
  bool suppressChrome;
  @JsonKey(name: 'profile_url')
  String profileUrl;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'is_verified')
  bool isVerified;
  @JsonKey(name: 'website_url')
  String websiteUrl;

  User(
    this.avatarUrl,
    this.bannerUrl,
    this.description,
    this.displayName,
    this.instagramUrl,
    this.isPublic,
    this.isStaff,
    this.suppressChrome,
    this.profileUrl,
    this.username,
    this.isVerified,
    this.websiteUrl,
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
