import 'package:json_annotation/json_annotation.dart';

part 'user_dictionary.g.dart';

@JsonSerializable()
class UserDictionary {
  @JsonKey(name: 'rk')
  String rk;
  @JsonKey(name: 'pk')
  String pk;

  UserDictionary(this.rk, this.pk);

  factory UserDictionary.fromJson(Map<String, dynamic> json) =>
      _$UserDictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$UserDictionaryToJson(this);
}
