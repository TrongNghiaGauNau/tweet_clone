// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_creator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TweetCreator _$TweetCreatorFromJson(Map<String, dynamic> json) {
  return _TweetCreator.fromJson(json);
}

/// @nodoc
mixin _$TweetCreator {
  String get profilePic => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  bool get isTwitterBlue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCreatorCopyWith<TweetCreator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCreatorCopyWith<$Res> {
  factory $TweetCreatorCopyWith(
          TweetCreator value, $Res Function(TweetCreator) then) =
      _$TweetCreatorCopyWithImpl<$Res, TweetCreator>;
  @useResult
  $Res call({String profilePic, String uid, bool isTwitterBlue});
}

/// @nodoc
class _$TweetCreatorCopyWithImpl<$Res, $Val extends TweetCreator>
    implements $TweetCreatorCopyWith<$Res> {
  _$TweetCreatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePic = null,
    Object? uid = null,
    Object? isTwitterBlue = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$TweetCreatorImplCopyWith<$Res>
    implements $TweetCreatorCopyWith<$Res> {
  factory _$$TweetCreatorImplCopyWith(
          _$TweetCreatorImpl value, $Res Function(_$TweetCreatorImpl) then) =
      __$$TweetCreatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profilePic, String uid, bool isTwitterBlue});
}

/// @nodoc
class __$$TweetCreatorImplCopyWithImpl<$Res>
    extends _$TweetCreatorCopyWithImpl<$Res, _$TweetCreatorImpl>
    implements _$$TweetCreatorImplCopyWith<$Res> {
  __$$TweetCreatorImplCopyWithImpl(
      _$TweetCreatorImpl _value, $Res Function(_$TweetCreatorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profilePic = null,
    Object? uid = null,
    Object? isTwitterBlue = null,
  }) {
    return _then(_$TweetCreatorImpl(
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
class _$TweetCreatorImpl implements _TweetCreator {
  const _$TweetCreatorImpl(
      {required this.profilePic,
      required this.uid,
      this.isTwitterBlue = false});

  factory _$TweetCreatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$TweetCreatorImplFromJson(json);

  @override
  final String profilePic;
  @override
  final String uid;
  @override
  @JsonKey()
  final bool isTwitterBlue;

  @override
  String toString() {
    return 'TweetCreator(profilePic: $profilePic, uid: $uid, isTwitterBlue: $isTwitterBlue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetCreatorImpl &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.isTwitterBlue, isTwitterBlue) ||
                other.isTwitterBlue == isTwitterBlue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, profilePic, uid, isTwitterBlue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetCreatorImplCopyWith<_$TweetCreatorImpl> get copyWith =>
      __$$TweetCreatorImplCopyWithImpl<_$TweetCreatorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TweetCreatorImplToJson(
      this,
    );
  }
}

abstract class _TweetCreator implements TweetCreator {
  const factory _TweetCreator(
      {required final String profilePic,
      required final String uid,
      final bool isTwitterBlue}) = _$TweetCreatorImpl;

  factory _TweetCreator.fromJson(Map<String, dynamic> json) =
      _$TweetCreatorImpl.fromJson;

  @override
  String get profilePic;
  @override
  String get uid;
  @override
  bool get isTwitterBlue;
  @override
  @JsonKey(ignore: true)
  _$$TweetCreatorImplCopyWith<_$TweetCreatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
