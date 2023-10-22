import 'package:json_annotation/json_annotation.dart';
part 'users_list_response_model.g.dart';

@JsonSerializable()
class UsersListResponseModel {
  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'per_page')
  int? perPage;

  @JsonKey(name: 'total')
  int? total;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'data')
  List<DataResponseModel>? data;

  @JsonKey(name: 'support')
  SupportResponseModel? support;

  factory UsersListResponseModel.fromJson(Map<String, dynamic> srcJson) =>
      _$UsersListResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UsersListResponseModelToJson(this);

  UsersListResponseModel(
      this.page,
      this.perPage,
      this.total,
      this.totalPages,
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
