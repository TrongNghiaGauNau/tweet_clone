// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationState _$NotificationStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return _NotificationInit.fromJson(json);
    case 'data':
      return _NotificationData.fromJson(json);
    case 'error':
      return _NotificationError.fromJson(json);
    case 'empty':
      return _NotificationEmpty.fromJson(json);
    case 'loading':
      return _NotificationLoading.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NotificationState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<NotificationModel> notificationList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<NotificationModel> notificationList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<NotificationModel> notificationList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInit value) init,
    required TResult Function(_NotificationData value) data,
    required TResult Function(_NotificationError value) error,
    required TResult Function(_NotificationEmpty value) empty,
    required TResult Function(_NotificationLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInit value)? init,
    TResult? Function(_NotificationData value)? data,
    TResult? Function(_NotificationError value)? error,
    TResult? Function(_NotificationEmpty value)? empty,
    TResult? Function(_NotificationLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInit value)? init,
    TResult Function(_NotificationData value)? data,
    TResult Function(_NotificationError value)? error,
    TResult Function(_NotificationEmpty value)? empty,
    TResult Function(_NotificationLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotificationInitImplCopyWith<$Res> {
  factory _$$NotificationInitImplCopyWith(_$NotificationInitImpl value,
          $Res Function(_$NotificationInitImpl) then) =
      __$$NotificationInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationInitImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationInitImpl>
    implements _$$NotificationInitImplCopyWith<$Res> {
  __$$NotificationInitImplCopyWithImpl(_$NotificationInitImpl _value,
      $Res Function(_$NotificationInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NotificationInitImpl extends _NotificationInit {
  const _$NotificationInitImpl({final String? $type})
      : $type = $type ?? 'init',
        super._();

  factory _$NotificationInitImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationInitImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotificationInitImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<NotificationModel> notificationList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<NotificationModel> notificationList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<NotificationModel> notificationList)? data,
    TResult Function()? error,
    TResult Function()? empty,
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
    required TResult Function(_NotificationInit value) init,
    required TResult Function(_NotificationData value) data,
    required TResult Function(_NotificationError value) error,
    required TResult Function(_NotificationEmpty value) empty,
    required TResult Function(_NotificationLoading value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInit value)? init,
    TResult? Function(_NotificationData value)? data,
    TResult? Function(_NotificationError value)? error,
    TResult? Function(_NotificationEmpty value)? empty,
    TResult? Function(_NotificationLoading value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInit value)? init,
    TResult Function(_NotificationData value)? data,
    TResult Function(_NotificationError value)? error,
    TResult Function(_NotificationEmpty value)? empty,
    TResult Function(_NotificationLoading value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationInitImplToJson(
      this,
    );
  }
}

abstract class _NotificationInit extends NotificationState {
  const factory _NotificationInit() = _$NotificationInitImpl;
  const _NotificationInit._() : super._();

  factory _NotificationInit.fromJson(Map<String, dynamic> json) =
      _$NotificationInitImpl.fromJson;
}

/// @nodoc
abstract class _$$NotificationDataImplCopyWith<$Res> {
  factory _$$NotificationDataImplCopyWith(_$NotificationDataImpl value,
          $Res Function(_$NotificationDataImpl) then) =
      __$$NotificationDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<NotificationModel> notificationList});
}

/// @nodoc
class __$$NotificationDataImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationDataImpl>
    implements _$$NotificationDataImplCopyWith<$Res> {
  __$$NotificationDataImplCopyWithImpl(_$NotificationDataImpl _value,
      $Res Function(_$NotificationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationList = null,
  }) {
    return _then(_$NotificationDataImpl(
      notificationList: null == notificationList
          ? _value._notificationList
          : notificationList // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationDataImpl extends _NotificationData {
  const _$NotificationDataImpl(
      {required final List<NotificationModel> notificationList,
      final String? $type})
      : _notificationList = notificationList,
        $type = $type ?? 'data',
        super._();

  factory _$NotificationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationDataImplFromJson(json);

  final List<NotificationModel> _notificationList;
  @override
  List<NotificationModel> get notificationList {
    if (_notificationList is EqualUnmodifiableListView)
      return _notificationList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationList);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationState.data(notificationList: $notificationList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationDataImpl &&
            const DeepCollectionEquality()
                .equals(other._notificationList, _notificationList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notificationList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      __$$NotificationDataImplCopyWithImpl<_$NotificationDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<NotificationModel> notificationList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return data(notificationList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<NotificationModel> notificationList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return data?.call(notificationList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<NotificationModel> notificationList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(notificationList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInit value) init,
    required TResult Function(_NotificationData value) data,
    required TResult Function(_NotificationError value) error,
    required TResult Function(_NotificationEmpty value) empty,
    required TResult Function(_NotificationLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInit value)? init,
    TResult? Function(_NotificationData value)? data,
    TResult? Function(_NotificationError value)? error,
    TResult? Function(_NotificationEmpty value)? empty,
    TResult? Function(_NotificationLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInit value)? init,
    TResult Function(_NotificationData value)? data,
    TResult Function(_NotificationError value)? error,
    TResult Function(_NotificationEmpty value)? empty,
    TResult Function(_NotificationLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationDataImplToJson(
      this,
    );
  }
}

abstract class _NotificationData extends NotificationState {
  const factory _NotificationData(
          {required final List<NotificationModel> notificationList}) =
      _$NotificationDataImpl;
  const _NotificationData._() : super._();

  factory _NotificationData.fromJson(Map<String, dynamic> json) =
      _$NotificationDataImpl.fromJson;

  List<NotificationModel> get notificationList;
  @JsonKey(ignore: true)
  _$$NotificationDataImplCopyWith<_$NotificationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotificationErrorImplCopyWith<$Res> {
  factory _$$NotificationErrorImplCopyWith(_$NotificationErrorImpl value,
          $Res Function(_$NotificationErrorImpl) then) =
      __$$NotificationErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationErrorImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationErrorImpl>
    implements _$$NotificationErrorImplCopyWith<$Res> {
  __$$NotificationErrorImplCopyWithImpl(_$NotificationErrorImpl _value,
      $Res Function(_$NotificationErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NotificationErrorImpl extends _NotificationError {
  const _$NotificationErrorImpl({final String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$NotificationErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotificationErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<NotificationModel> notificationList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<NotificationModel> notificationList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<NotificationModel> notificationList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInit value) init,
    required TResult Function(_NotificationData value) data,
    required TResult Function(_NotificationError value) error,
    required TResult Function(_NotificationEmpty value) empty,
    required TResult Function(_NotificationLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInit value)? init,
    TResult? Function(_NotificationData value)? data,
    TResult? Function(_NotificationError value)? error,
    TResult? Function(_NotificationEmpty value)? empty,
    TResult? Function(_NotificationLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInit value)? init,
    TResult Function(_NotificationData value)? data,
    TResult Function(_NotificationError value)? error,
    TResult Function(_NotificationEmpty value)? empty,
    TResult Function(_NotificationLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationErrorImplToJson(
      this,
    );
  }
}

abstract class _NotificationError extends NotificationState {
  const factory _NotificationError() = _$NotificationErrorImpl;
  const _NotificationError._() : super._();

  factory _NotificationError.fromJson(Map<String, dynamic> json) =
      _$NotificationErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$NotificationEmptyImplCopyWith<$Res> {
  factory _$$NotificationEmptyImplCopyWith(_$NotificationEmptyImpl value,
          $Res Function(_$NotificationEmptyImpl) then) =
      __$$NotificationEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationEmptyImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationEmptyImpl>
    implements _$$NotificationEmptyImplCopyWith<$Res> {
  __$$NotificationEmptyImplCopyWithImpl(_$NotificationEmptyImpl _value,
      $Res Function(_$NotificationEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NotificationEmptyImpl extends _NotificationEmpty {
  const _$NotificationEmptyImpl({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$NotificationEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationEmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotificationEmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<NotificationModel> notificationList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<NotificationModel> notificationList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<NotificationModel> notificationList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotificationInit value) init,
    required TResult Function(_NotificationData value) data,
    required TResult Function(_NotificationError value) error,
    required TResult Function(_NotificationEmpty value) empty,
    required TResult Function(_NotificationLoading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInit value)? init,
    TResult? Function(_NotificationData value)? data,
    TResult? Function(_NotificationError value)? error,
    TResult? Function(_NotificationEmpty value)? empty,
    TResult? Function(_NotificationLoading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInit value)? init,
    TResult Function(_NotificationData value)? data,
    TResult Function(_NotificationError value)? error,
    TResult Function(_NotificationEmpty value)? empty,
    TResult Function(_NotificationLoading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationEmptyImplToJson(
      this,
    );
  }
}

abstract class _NotificationEmpty extends NotificationState {
  const factory _NotificationEmpty() = _$NotificationEmptyImpl;
  const _NotificationEmpty._() : super._();

  factory _NotificationEmpty.fromJson(Map<String, dynamic> json) =
      _$NotificationEmptyImpl.fromJson;
}

/// @nodoc
abstract class _$$NotificationLoadingImplCopyWith<$Res> {
  factory _$$NotificationLoadingImplCopyWith(_$NotificationLoadingImpl value,
          $Res Function(_$NotificationLoadingImpl) then) =
      __$$NotificationLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotificationLoadingImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationLoadingImpl>
    implements _$$NotificationLoadingImplCopyWith<$Res> {
  __$$NotificationLoadingImplCopyWithImpl(_$NotificationLoadingImpl _value,
      $Res Function(_$NotificationLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NotificationLoadingImpl extends _NotificationLoading {
  const _$NotificationLoadingImpl({final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$NotificationLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<NotificationModel> notificationList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<NotificationModel> notificationList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<NotificationModel> notificationList)? data,
    TResult Function()? error,
    TResult Function()? empty,
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
    required TResult Function(_NotificationInit value) init,
    required TResult Function(_NotificationData value) data,
    required TResult Function(_NotificationError value) error,
    required TResult Function(_NotificationEmpty value) empty,
    required TResult Function(_NotificationLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotificationInit value)? init,
    TResult? Function(_NotificationData value)? data,
    TResult? Function(_NotificationError value)? error,
    TResult? Function(_NotificationEmpty value)? empty,
    TResult? Function(_NotificationLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotificationInit value)? init,
    TResult Function(_NotificationData value)? data,
    TResult Function(_NotificationError value)? error,
    TResult Function(_NotificationEmpty value)? empty,
    TResult Function(_NotificationLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationLoadingImplToJson(
      this,
    );
  }
}

abstract class _NotificationLoading extends NotificationState {
  const factory _NotificationLoading() = _$NotificationLoadingImpl;
  const _NotificationLoading._() : super._();

  factory _NotificationLoading.fromJson(Map<String, dynamic> json) =
      _$NotificationLoadingImpl.fromJson;
}
