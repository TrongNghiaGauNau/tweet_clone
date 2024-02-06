// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_ui.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserUI _$UserUIFromJson(Map<String, dynamic> json) {
  return _UserUI.fromJson(json);
}

/// @nodoc
mixin _$UserUI {
  String get name => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  bool get isTwitterBlue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserUICopyWith<UserUI> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserUICopyWith<$Res> {
  factory $UserUICopyWith(UserUI value, $Res Function(UserUI) then) =
      _$UserUICopyWithImpl<$Res, UserUI>;
  @useResult
  $Res call({String name, String profilePic, String uid, bool isTwitterBlue});
}

/// @nodoc
class _$UserUICopyWithImpl<$Res, $Val extends UserUI>
    implements $UserUICopyWith<$Res> {
  _$UserUICopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePic = null,
    Object? uid = null,
    Object? isTwitterBlue = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      isTwitterBlue: null == isTwitterBlue
          ? _value.isTwitterBlue
          : isTwitterBlue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserUIImplCopyWith<$Res> implements $UserUICopyWith<$Res> {
  factory _$$UserUIImplCopyWith(
          _$UserUIImpl value, $Res Function(_$UserUIImpl) then) =
      __$$UserUIImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String profilePic, String uid, bool isTwitterBlue});
}

/// @nodoc
class __$$UserUIImplCopyWithImpl<$Res>
    extends _$UserUICopyWithImpl<$Res, _$UserUIImpl>
    implements _$$UserUIImplCopyWith<$Res> {
  __$$UserUIImplCopyWithImpl(
      _$UserUIImpl _value, $Res Function(_$UserUIImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePic = null,
    Object? uid = null,
    Object? isTwitterBlue = null,
  }) {
    return _then(_$UserUIImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      isTwitterBlue: null == isTwitterBlue
          ? _value.isTwitterBlue
          : isTwitterBlue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserUIImpl implements _UserUI {
  const _$UserUIImpl(
      {required this.name,
      required this.profilePic,
      required this.uid,
      this.isTwitterBlue = false});

  factory _$UserUIImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserUIImplFromJson(json);

  @override
  final String name;
  @override
  final String profilePic;
  @override
  final String uid;
  @override
  @JsonKey()
  final bool isTwitterBlue;

  @override
  String toString() {
    return 'UserUI(name: $name, profilePic: $profilePic, uid: $uid, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUIImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.isTwitterBlue, isTwitterBlue) ||
                other.isTwitterBlue == isTwitterBlue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, profilePic, uid, isTwitterBlue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUIImplCopyWith<_$UserUIImpl> get copyWith =>
      __$$UserUIImplCopyWithImpl<_$UserUIImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserUIImplToJson(
      this,
    );
  }
}

abstract class _UserUI implements UserUI {
  const factory _UserUI(
      {required final String name,
      required final String profilePic,
      required final String uid,
      final bool isTwitterBlue}) = _$UserUIImpl;

  factory _UserUI.fromJson(Map<String, dynamic> json) = _$UserUIImpl.fromJson;

  @override
  String get name;
  @override
  String get profilePic;
  @override
  String get uid;
  @override
  bool get isTwitterBlue;
  @override
  @JsonKey(ignore: true)
  _$$UserUIImplCopyWith<_$UserUIImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
