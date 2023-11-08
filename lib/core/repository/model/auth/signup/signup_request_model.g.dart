// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpRequestModelImpl _$$SignUpRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SignUpRequestModelImpl(
      userType: json['userType'] as bool,
      userName: json['userName'] as String,
      photoUrl: json['photoUrl'] as String?,
      name: json['name'] as String,
      surname: json['surname'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      birth: json['birth'] as String,
    );

Map<String, dynamic> _$$SignUpRequestModelImplToJson(
        _$SignUpRequestModelImpl instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'userName': instance.userName,
      'photoUrl': instance.photoUrl,
      'name': instance.name,
      'surname': instance.surname,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'birth': instance.birth,
    };
