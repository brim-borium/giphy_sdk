// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['avatar_url'] as String,
      json['banner_url'] as String,
      json['description'] as String,
      json['display_name'] as String,
      json['instagram_url'] as String,
      json['is_public'] as bool,
      json['is_staff'] as bool,
      json['suppress_chrome'] as bool,
      json['profile_url'] as String,
      json['username'] as String,
      json['is_verified'] as bool,
      json['website_url'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'banner_url': instance.bannerUrl,
      'description': instance.description,
      'display_name': instance.displayName,
      'instagram_url': instance.instagramUrl,
      'is_public': instance.isPublic,
      'is_staff': instance.isStaff,
      'suppress_chrome': instance.suppressChrome,
      'profile_url': instance.profileUrl,
      'username': instance.username,
      'is_verified': instance.isVerified,
      'website_url': instance.websiteUrl,
    };
