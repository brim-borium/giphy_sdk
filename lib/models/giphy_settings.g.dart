// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'giphy_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiphySettings _$GiphySettingsFromJson(Map<String, dynamic> json) =>
    GiphySettings(
      theme: $enumDecodeNullable(_$GiphyThemeEnumMap, json['theme']) ??
          GiphyTheme.automatic,
      contentTypes: (json['contentTypes'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$GiphyContentTypeEnumMap, e))
              .toList() ??
          const [
            GiphyContentType.clips,
            GiphyContentType.gif,
            GiphyContentType.sticker,
            GiphyContentType.text,
            GiphyContentType.emoji,
            GiphyContentType.recents
          ],
      columnCount: json['columnCount'] as int? ?? 3,
      selectedContentType: $enumDecodeNullable(
              _$GiphyContentTypeEnumMap, json['selectedContentType']) ??
          GiphyContentType.gif,
      showSuggestionsBar: json['showSuggestionsBar'] as bool? ?? true,
      showConfirmationScreen: json['showConfirmationScreen'] as bool? ?? true,
      enabledDynamicText: json['enabledDynamicText'] as bool? ?? true,
    );

Map<String, dynamic> _$GiphySettingsToJson(GiphySettings instance) =>
    <String, dynamic>{
      'theme': _$GiphyThemeEnumMap[instance.theme],
      'contentTypes': instance.contentTypes
          .map((e) => _$GiphyContentTypeEnumMap[e])
          .toList(),
      'columnCount': instance.columnCount,
      'selectedContentType':
          _$GiphyContentTypeEnumMap[instance.selectedContentType],
      'showSuggestionsBar': instance.showSuggestionsBar,
      'showConfirmationScreen': instance.showConfirmationScreen,
      'enabledDynamicText': instance.enabledDynamicText,
    };

const _$GiphyThemeEnumMap = {
  GiphyTheme.automatic: 'automatic',
  GiphyTheme.light: 'light',
  GiphyTheme.dark: 'dark',
  GiphyTheme.custom: 'custom',
};

const _$GiphyContentTypeEnumMap = {
  GiphyContentType.clips: 'clips',
  GiphyContentType.gif: 'gif',
  GiphyContentType.sticker: 'sticker',
  GiphyContentType.text: 'text',
  GiphyContentType.emoji: 'emoji',
  GiphyContentType.recents: 'recents',
};
