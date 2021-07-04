import 'package:json_annotation/json_annotation.dart';

part 'user_api.g.dart';

@JsonSerializable()
class UserApi {
  UserApi({required this.user, required this.token});

  factory UserApi.fromJson(Map<String, dynamic> json) =>
      _$UserApiFromJson(json);
  final UserDetails user;
  final String token;
}

@JsonSerializable()
class UserDetails {
  UserDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String email;
  final String createdAt;
}
