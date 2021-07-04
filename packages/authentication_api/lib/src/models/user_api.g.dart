// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApi _$UserApiFromJson(Map<String, dynamic> json) {
  return UserApi(
    user: UserDetails.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$UserApiToJson(UserApi instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return UserDetails(
    id: json['_id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'createdAt': instance.createdAt,
    };
