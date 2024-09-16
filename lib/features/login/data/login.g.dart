// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
      isSuccess: json['isSuccess'] as bool?,
      status: (json['status'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      totalPage: (json['totalPage'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
      'totalPage': instance.totalPage,
      'page': instance.page,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      refreshToken: json['refreshToken'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'refreshToken': instance.refreshToken,
      'token': instance.token,
    };
