// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return _AuthInit.fromJson(json);
    case 'success':
      return _AuthSuccess.fromJson(json);
    case 'failure':
      return _AuthFailure.fromJson(json);
    case 'loading':
      return _AuthLoading.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AuthState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthSuccess value) success,
    required TResult Function(_AuthFailure value) failure,
    required TResult Function(_AuthLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_AuthSuccess value)? success,
    TResult? Function(_AuthFailure value)? failure,
    TResult? Function(_AuthLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthSuccess value)? success,
    TResult Function(_AuthFailure value)? failure,
    TResult Function(_AuthLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthInitImplCopyWith<$Res> {
  factory _$$AuthInitImplCopyWith(
          _$AuthInitImpl value, $Res Function(_$AuthInitImpl) then) =
      __$$AuthInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthInitImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInitImpl>
    implements _$$AuthInitImplCopyWith<$Res> {
  __$$AuthInitImplCopyWithImpl(
      _$AuthInitImpl _value, $Res Function(_$AuthInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthInitImpl extends _AuthInit {
  const _$AuthInitImpl({final String? $type})
      : $type = $type ?? 'init',
        super._();

  factory _$AuthInitImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthInitImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthInitImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthSuccess value) success,
    required TResult Function(_AuthFailure value) failure,
    required TResult Function(_AuthLoading value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_AuthSuccess value)? success,
    TResult? Function(_AuthFailure value)? failure,
    TResult? Function(_AuthLoading value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthSuccess value)? success,
    TResult Function(_AuthFailure value)? failure,
    TResult Function(_AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthInitImplToJson(
      this,
    );
  }
}

abstract class _AuthInit extends AuthState {
  const factory _AuthInit() = _$AuthInitImpl;
  const _AuthInit._() : super._();

  factory _AuthInit.fromJson(Map<String, dynamic> json) =
      _$AuthInitImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
          _$AuthSuccessImpl value, $Res Function(_$AuthSuccessImpl) then) =
      __$$AuthSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl _value, $Res Function(_$AuthSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthSuccessImpl extends _AuthSuccess {
  const _$AuthSuccessImpl({final String? $type})
      : $type = $type ?? 'success',
        super._();

  factory _$AuthSuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthSuccessImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthSuccessImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthSuccess value) success,
    required TResult Function(_AuthFailure value) failure,
    required TResult Function(_AuthLoading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_AuthSuccess value)? success,
    TResult? Function(_AuthFailure value)? failure,
    TResult? Function(_AuthLoading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthSuccess value)? success,
    TResult Function(_AuthFailure value)? failure,
    TResult Function(_AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthSuccessImplToJson(
      this,
    );
  }
}

abstract class _AuthSuccess extends AuthState {
  const factory _AuthSuccess() = _$AuthSuccessImpl;
  const _AuthSuccess._() : super._();

  factory _AuthSuccess.fromJson(Map<String, dynamic> json) =
      _$AuthSuccessImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthFailureImpl extends _AuthFailure {
  const _$AuthFailureImpl({final String? $type})
      : $type = $type ?? 'failure',
        super._();

  factory _$AuthFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthFailureImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthFailureImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthSuccess value) success,
    required TResult Function(_AuthFailure value) failure,
    required TResult Function(_AuthLoading value) loading,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_AuthSuccess value)? success,
    TResult? Function(_AuthFailure value)? failure,
    TResult? Function(_AuthLoading value)? loading,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthSuccess value)? success,
    TResult Function(_AuthFailure value)? failure,
    TResult Function(_AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthFailureImplToJson(
      this,
    );
  }
}

abstract class _AuthFailure extends AuthState {
  const factory _AuthFailure() = _$AuthFailureImpl;
  const _AuthFailure._() : super._();

  factory _AuthFailure.fromJson(Map<String, dynamic> json) =
      _$AuthFailureImpl.fromJson;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<$Res> {
  factory _$$AuthLoadingImplCopyWith(
          _$AuthLoadingImpl value, $Res Function(_$AuthLoadingImpl) then) =
      __$$AuthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthLoadingImpl>
    implements _$$AuthLoadingImplCopyWith<$Res> {
  __$$AuthLoadingImplCopyWithImpl(
      _$AuthLoadingImpl _value, $Res Function(_$AuthLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$AuthLoadingImpl extends _AuthLoading {
  const _$AuthLoadingImpl({final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$AuthLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() success,
    required TResult Function() failure,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? success,
    TResult? Function()? failure,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? success,
    TResult Function()? failure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthInit value) init,
    required TResult Function(_AuthSuccess value) success,
    required TResult Function(_AuthFailure value) failure,
    required TResult Function(_AuthLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthInit value)? init,
    TResult? Function(_AuthSuccess value)? success,
    TResult? Function(_AuthFailure value)? failure,
    TResult? Function(_AuthLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthInit value)? init,
    TResult Function(_AuthSuccess value)? success,
    TResult Function(_AuthFailure value)? failure,
    TResult Function(_AuthLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthLoadingImplToJson(
      this,
    );
  }
}

abstract class _AuthLoading extends AuthState {
  const factory _AuthLoading() = _$AuthLoadingImpl;
  const _AuthLoading._() : super._();

  factory _AuthLoading.fromJson(Map<String, dynamic> json) =
      _$AuthLoadingImpl.fromJson;
}
