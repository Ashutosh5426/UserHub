import 'package:json_annotation/json_annotation.dart';
part 'user_details_response_model.g.dart';

@JsonSerializable()
class UserDetailsResponseModel {
  @JsonKey(name: 'data')
  DataResponseModel? data;

  @JsonKey(name: 'support')
  SupportResponseModel? support;

  factory UserDetailsResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UserDetailsResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDetailsResponseModelToJson(this);

  UserDetailsResponseModel(
      this.data,
      this.support,
      );
}

@JsonSerializable()
class SupportResponseModel {
  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'text')
  String? text;

  factory SupportResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$SupportResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SupportResponseModelToJson(this);

  SupportResponseModel(
      this.url,
      this.text,
      );
}

@JsonSerializable()
class DataResponseModel {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'last_name')
  String? lastName;

  @JsonKey(name: 'avatar')
  String? avatar;

  factory DataResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$DataResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataResponseModelToJson(this);

  DataResponseModel(
      this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      );
}
