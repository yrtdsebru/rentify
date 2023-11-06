// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostRequestModel _$PostRequestModelFromJson(Map<String, dynamic> json) {
  return _PostRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PostRequestModel {
  String get label => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostRequestModelCopyWith<PostRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostRequestModelCopyWith<$Res> {
  factory $PostRequestModelCopyWith(
          PostRequestModel value, $Res Function(PostRequestModel) then) =
      _$PostRequestModelCopyWithImpl<$Res, PostRequestModel>;
  @useResult
  $Res call({String label, String content});
}

/// @nodoc
class _$PostRequestModelCopyWithImpl<$Res, $Val extends PostRequestModel>
    implements $PostRequestModelCopyWith<$Res> {
  _$PostRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostRequestModelImplCopyWith<$Res>
    implements $PostRequestModelCopyWith<$Res> {
  factory _$$PostRequestModelImplCopyWith(_$PostRequestModelImpl value,
          $Res Function(_$PostRequestModelImpl) then) =
      __$$PostRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String content});
}

/// @nodoc
class __$$PostRequestModelImplCopyWithImpl<$Res>
    extends _$PostRequestModelCopyWithImpl<$Res, _$PostRequestModelImpl>
    implements _$$PostRequestModelImplCopyWith<$Res> {
  __$$PostRequestModelImplCopyWithImpl(_$PostRequestModelImpl _value,
      $Res Function(_$PostRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? content = null,
  }) {
    return _then(_$PostRequestModelImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostRequestModelImpl implements _PostRequestModel {
  const _$PostRequestModelImpl({required this.label, required this.content});

  factory _$PostRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostRequestModelImplFromJson(json);

  @override
  final String label;
  @override
  final String content;

  @override
  String toString() {
    return 'PostRequestModel(label: $label, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostRequestModelImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostRequestModelImplCopyWith<_$PostRequestModelImpl> get copyWith =>
      __$$PostRequestModelImplCopyWithImpl<_$PostRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PostRequestModel implements PostRequestModel {
  const factory _PostRequestModel(
      {required final String label,
      required final String content}) = _$PostRequestModelImpl;

  factory _PostRequestModel.fromJson(Map<String, dynamic> json) =
      _$PostRequestModelImpl.fromJson;

  @override
  String get label;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$PostRequestModelImplCopyWith<_$PostRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
