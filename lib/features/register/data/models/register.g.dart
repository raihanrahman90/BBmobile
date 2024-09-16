// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Register _$RegisterFromJson(Map<String, dynamic> json) => Register(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };

RegisterData _$RegisterDataFromJson(Map<String, dynamic> json) => RegisterData(
      id: json['id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      username: json['username'] as String?,
      password: json['password'] as String?,
      access: (json['access'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$RegisterDataToJson(RegisterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'username': instance.username,
      'password': instance.password,
      'access': instance.access,
      'refreshToken': instance.refreshToken,
    };
