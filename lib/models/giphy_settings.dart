import 'package:giphy_sdk/enums/giphy_content_type.dart';
import 'package:giphy_sdk/enums/giphy_theme.dart';
import 'package:json_annotation/json_annotation.dart';

part 'giphy_settings.g.dart';

/// Used to configure the apperance and configuration of the giphy selection.
///
/// It uses a default set of settings but can individually be changed. For ease
/// of use there are multiple constructors available to create the object
///   [GiphySettings] -> everything enabled
///   [GiphySettings.textCreation] -> just text gifs with the GIPHY TEXT feature
@JsonSerializable()
class GiphySettings {
  /// Set the theme type to be [GiphyTheme.automatic], [GiphyTheme.light],
  /// [GiphyTheme.dark] or [GiphyTheme.custom] which will match the
  /// application's Night Mode specifications
  ///
  /// Defaults to automatic
  final GiphyTheme theme;

  /// Set the content type(s) you'd like to show, which is a List of
  /// [GiphyContentType]
  ///
  /// Defaults to show all available contentTypes
  ///
  /// Supported content types are
  ///   [GiphyContentType.clips],
  ///   [GiphyContentType.gif],
  ///   [GiphyContentType.sticker],
  ///   [GiphyContentType.text],
  ///   [GiphyContentType.emoji],
  ///   [GiphyContentType.recents]
  final List<GiphyContentType> contentTypes;

  /// Customise the number of columns for stickers
  /// (Accepted values between 2 and 4).
  ///
  /// Defaults to 3
  final int columnCount;

  /// Sets which [GiphyContentType] should be selected on default when opening
  /// the gif selection
  ///
  /// Defaults to [GiphyContentType.gif]
  final GiphyContentType selectedContentType;

  /// Option to show the suggestions bar
  ///
  /// Defaults to show the suggestions bar
  final bool showSuggestionsBar;

  /// Option to show a secondary confirmation screen when the user taps a GIF,
  /// which shows a larger rendition of the asset.
  ///
  /// Defaults to show a confirmation screen
  final bool showConfirmationScreen;

  /// Enable the GIPHY Text creation experience by setting
  /// the [enabledDynamicText] to true:
  ///
  /// Ensure that the [GiphyContentType.text] is included in your
  /// [selectedContentType] list.
  final bool enabledDynamicText;

  /// Creates the [GiphySettings] with default values
  const GiphySettings({
    this.theme = GiphyTheme.automatic,
    this.contentTypes = const [
      GiphyContentType.clips,
      GiphyContentType.gif,
      GiphyContentType.sticker,
      GiphyContentType.text,
      GiphyContentType.emoji,
      GiphyContentType.recents
    ],
    this.columnCount = 3,
    this.selectedContentType = GiphyContentType.gif,
    this.showSuggestionsBar = true,
    this.showConfirmationScreen = true,
    this.enabledDynamicText = true,
  }) : assert(columnCount >= 2 && columnCount <= 4);

  /// Creates the [GiphySettings] with just text creation enabled
  const GiphySettings.textCreation({
    this.theme = GiphyTheme.automatic,
    this.contentTypes = const [GiphyContentType.text],
    this.columnCount = 3,
    this.selectedContentType = GiphyContentType.text,
    this.showSuggestionsBar = true,
    this.showConfirmationScreen = true,
    this.enabledDynamicText = true,
  }) : assert(columnCount >= 2 && columnCount <= 4);

  factory GiphySettings.fromJson(Map<String, dynamic> json) =>
      _$GiphySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$GiphySettingsToJson(this);
}
