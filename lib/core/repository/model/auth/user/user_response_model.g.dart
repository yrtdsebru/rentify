// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseModelImpl _$$UserResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseModelImpl(
      userType: json['userType'] as bool,
      userName: json['userName'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      birth: json['birth'] as String,
    );

Map<String, dynamic> _$$UserResponseModelImplToJson(
        _$UserResponseModelImpl instance) =>
    <String, dynamic>{
      'userType': instance.userType,
      'userName': instance.userName,
      'name': instance.name,
      'surname': instance.surname,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'birth': instance.birth,
    };
