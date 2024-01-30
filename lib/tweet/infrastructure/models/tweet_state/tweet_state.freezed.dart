// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TweetState _$TweetStateFromJson(Map<String, dynamic> json) {
  return _TweetState.fromJson(json);
}

/// @nodoc
mixin _$TweetState {
  Tweet? get tweets => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetStateCopyWith<TweetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetStateCopyWith<$Res> {
  factory $TweetStateCopyWith(
          TweetState value, $Res Function(TweetState) then) =
      _$TweetStateCopyWithImpl<$Res, TweetState>;
  @useResult
  $Res call({Tweet? tweets, bool isLoading});

  $TweetCopyWith<$Res>? get tweets;
}

/// @nodoc
class _$TweetStateCopyWithImpl<$Res, $Val extends TweetState>
    implements $TweetStateCopyWith<$Res> {
  _$TweetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweets = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      tweets: freezed == tweets
          ? _value.tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as Tweet?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TweetCopyWith<$Res>? get tweets {
    if (_value.tweets == null) {
      return null;
    }

    return $TweetCopyWith<$Res>(_value.tweets!, (value) {
      return _then(_value.copyWith(tweets: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TweetStateImplCopyWith<$Res>
    implements $TweetStateCopyWith<$Res> {
  factory _$$TweetStateImplCopyWith(
          _$TweetStateImpl value, $Res Function(_$TweetStateImpl) then) =
      __$$TweetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tweet? tweets, bool isLoading});

  @override
  $TweetCopyWith<$Res>? get tweets;
}

/// @nodoc
class __$$TweetStateImplCopyWithImpl<$Res>
    extends _$TweetStateCopyWithImpl<$Res, _$TweetStateImpl>
    implements _$$TweetStateImplCopyWith<$Res> {
  __$$TweetStateImplCopyWithImpl(
      _$TweetStateImpl _value, $Res Function(_$TweetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweets = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$TweetStateImpl(
      tweets: freezed == tweets
          ? _value.tweets
          : tweets // ignore: cast_nullable_to_non_nullable
              as Tweet?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TweetStateImpl implements _TweetState {
  const _$TweetStateImpl({required this.tweets, required this.isLoading});

  factory _$TweetStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TweetStateImplFromJson(json);

  @override
  final Tweet? tweets;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'TweetState(tweets: $tweets, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetStateImpl &&
            (identical(other.tweets, tweets) || other.tweets == tweets) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tweets, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetStateImplCopyWith<_$TweetStateImpl> get copyWith =>
      __$$TweetStateImplCopyWithImpl<_$TweetStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TweetStateImplToJson(
      this,
    );
  }
}

abstract class _TweetState implements TweetState {
  const factory _TweetState(
      {required final Tweet? tweets,
      required final bool isLoading}) = _$TweetStateImpl;

  factory _TweetState.fromJson(Map<String, dynamic> json) =
      _$TweetStateImpl.fromJson;

  @override
  Tweet? get tweets;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$TweetStateImplCopyWith<_$TweetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
