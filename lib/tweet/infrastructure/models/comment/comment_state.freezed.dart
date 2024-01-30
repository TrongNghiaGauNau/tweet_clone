// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentState _$CommentStateFromJson(Map<String, dynamic> json) {
  return _CommentState.fromJson(json);
}

/// @nodoc
mixin _$CommentState {
  List<Comment> get tweetComments => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentStateCopyWith<CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res, CommentState>;
  @useResult
  $Res call({List<Comment> tweetComments, bool isLoading});
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res, $Val extends CommentState>
    implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweetComments = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      tweetComments: null == tweetComments
          ? _value.tweetComments
          : tweetComments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentStateImplCopyWith<$Res>
    implements $CommentStateCopyWith<$Res> {
  factory _$$CommentStateImplCopyWith(
          _$CommentStateImpl value, $Res Function(_$CommentStateImpl) then) =
      __$$CommentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Comment> tweetComments, bool isLoading});
}

/// @nodoc
class __$$CommentStateImplCopyWithImpl<$Res>
    extends _$CommentStateCopyWithImpl<$Res, _$CommentStateImpl>
    implements _$$CommentStateImplCopyWith<$Res> {
  __$$CommentStateImplCopyWithImpl(
      _$CommentStateImpl _value, $Res Function(_$CommentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tweetComments = null,
    Object? isLoading = null,
  }) {
    return _then(_$CommentStateImpl(
      tweetComments: null == tweetComments
          ? _value._tweetComments
          : tweetComments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentStateImpl implements _CommentState {
  const _$CommentStateImpl(
      {final List<Comment> tweetComments = const [], this.isLoading = false})
      : _tweetComments = tweetComments;

  factory _$CommentStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentStateImplFromJson(json);

  final List<Comment> _tweetComments;
  @override
  @JsonKey()
  List<Comment> get tweetComments {
    if (_tweetComments is EqualUnmodifiableListView) return _tweetComments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tweetComments);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CommentState(tweetComments: $tweetComments, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentStateImpl &&
            const DeepCollectionEquality()
                .equals(other._tweetComments, _tweetComments) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_tweetComments), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentStateImplCopyWith<_$CommentStateImpl> get copyWith =>
      __$$CommentStateImplCopyWithImpl<_$CommentStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentStateImplToJson(
      this,
    );
  }
}

abstract class _CommentState implements CommentState {
  const factory _CommentState(
      {final List<Comment> tweetComments,
      final bool isLoading}) = _$CommentStateImpl;

  factory _CommentState.fromJson(Map<String, dynamic> json) =
      _$CommentStateImpl.fromJson;

  @override
  List<Comment> get tweetComments;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CommentStateImplCopyWith<_$CommentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
