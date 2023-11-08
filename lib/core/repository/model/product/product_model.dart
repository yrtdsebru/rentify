// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

@freezed
class ProductModel with _$ProductModel {
    const factory ProductModel({
        required int id,
        required List<String> images,
        required String title,
        required String category,
        required String description,
        required double cost,
        required bool isRented,
        required DateTime startDate,
        required DateTime endDate,
        required int ownerId,  //user id
        required int renterId,
    }) = _ProductModel;

    factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}
