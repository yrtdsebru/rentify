// To parse this JSON data, do
//
//     final postRequestModel = postRequestModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_request_model.freezed.dart';
part 'post_request_model.g.dart';

PostRequestModel postRequestModelFromJson(String str) => PostRequestModel.fromJson(json.decode(str));

String postRequestModelToJson(PostRequestModel data) => json.encode(data.toJson());

@freezed
class PostRequestModel with _$PostRequestModel {
    const factory PostRequestModel({
        required String label,
        required String content,
    }) = _PostRequestModel;

    factory PostRequestModel.fromJson(Map<String, dynamic> json) => _$PostRequestModelFromJson(json);
}
