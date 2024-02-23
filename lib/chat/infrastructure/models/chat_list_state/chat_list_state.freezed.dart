// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatListState _$ChatListStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return _ChatListInit.fromJson(json);
    case 'data':
      return _ChatListData.fromJson(json);
    case 'error':
      return _ChatListError.fromJson(json);
    case 'empty':
      return _ChatListEmpty.fromJson(json);
    case 'loading':
      return _ChatListLoading.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChatListState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChatListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<User> chatList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<User> chatList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<User> chatList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatListInit value) init,
    required TResult Function(_ChatListData value) data,
    required TResult Function(_ChatListError value) error,
    required TResult Function(_ChatListEmpty value) empty,
    required TResult Function(_ChatListLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatListInit value)? init,
    TResult? Function(_ChatListData value)? data,
    TResult? Function(_ChatListError value)? error,
    TResult? Function(_ChatListEmpty value)? empty,
    TResult? Function(_ChatListLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatListInit value)? init,
    TResult Function(_ChatListData value)? data,
    TResult Function(_ChatListError value)? error,
    TResult Function(_ChatListEmpty value)? empty,
    TResult Function(_ChatListLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListStateCopyWith<$Res> {
  factory $ChatListStateCopyWith(
          ChatListState value, $Res Function(ChatListState) then) =
      _$ChatListStateCopyWithImpl<$Res, ChatListState>;
}

/// @nodoc
class _$ChatListStateCopyWithImpl<$Res, $Val extends ChatListState>
    implements $ChatListStateCopyWith<$Res> {
  _$ChatListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatListInitImplCopyWith<$Res> {
  factory _$$ChatListInitImplCopyWith(
          _$ChatListInitImpl value, $Res Function(_$ChatListInitImpl) then) =
      __$$ChatListInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatListInitImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListInitImpl>
    implements _$$ChatListInitImplCopyWith<$Res> {
  __$$ChatListInitImplCopyWithImpl(
      _$ChatListInitImpl _value, $Res Function(_$ChatListInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatListInitImpl extends _ChatListInit {
  const _$ChatListInitImpl({final String? $type})
      : $type = $type ?? 'init',
        super._();

  factory _$ChatListInitImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListInitImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatListState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatListInitImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<User> chatList) data,
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
    TResult? Function(List<User> chatList)? data,
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
    TResult Function(List<User> chatList)? data,
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
    required TResult Function(_ChatListInit value) init,
    required TResult Function(_ChatListData value) data,
    required TResult Function(_ChatListError value) error,
    required TResult Function(_ChatListEmpty value) empty,
    required TResult Function(_ChatListLoading value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatListInit value)? init,
    TResult? Function(_ChatListData value)? data,
    TResult? Function(_ChatListError value)? error,
    TResult? Function(_ChatListEmpty value)? empty,
    TResult? Function(_ChatListLoading value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatListInit value)? init,
    TResult Function(_ChatListData value)? data,
    TResult Function(_ChatListError value)? error,
    TResult Function(_ChatListEmpty value)? empty,
    TResult Function(_ChatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListInitImplToJson(
      this,
    );
  }
}

abstract class _ChatListInit extends ChatListState {
  const factory _ChatListInit() = _$ChatListInitImpl;
  const _ChatListInit._() : super._();

  factory _ChatListInit.fromJson(Map<String, dynamic> json) =
      _$ChatListInitImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatListDataImplCopyWith<$Res> {
  factory _$$ChatListDataImplCopyWith(
          _$ChatListDataImpl value, $Res Function(_$ChatListDataImpl) then) =
      __$$ChatListDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> chatList});
}

/// @nodoc
class __$$ChatListDataImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListDataImpl>
    implements _$$ChatListDataImplCopyWith<$Res> {
  __$$ChatListDataImplCopyWithImpl(
      _$ChatListDataImpl _value, $Res Function(_$ChatListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatList = null,
  }) {
    return _then(_$ChatListDataImpl(
      chatList: null == chatList
          ? _value._chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatListDataImpl extends _ChatListData {
  const _$ChatListDataImpl(
      {required final List<User> chatList, final String? $type})
      : _chatList = chatList,
        $type = $type ?? 'data',
        super._();

  factory _$ChatListDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListDataImplFromJson(json);

  final List<User> _chatList;
  @override
  List<User> get chatList {
    if (_chatList is EqualUnmodifiableListView) return _chatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatList);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatListState.data(chatList: $chatList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListDataImpl &&
            const DeepCollectionEquality().equals(other._chatList, _chatList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chatList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListDataImplCopyWith<_$ChatListDataImpl> get copyWith =>
      __$$ChatListDataImplCopyWithImpl<_$ChatListDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<User> chatList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return data(chatList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<User> chatList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return data?.call(chatList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<User> chatList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(chatList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatListInit value) init,
    required TResult Function(_ChatListData value) data,
    required TResult Function(_ChatListError value) error,
    required TResult Function(_ChatListEmpty value) empty,
    required TResult Function(_ChatListLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatListInit value)? init,
    TResult? Function(_ChatListData value)? data,
    TResult? Function(_ChatListError value)? error,
    TResult? Function(_ChatListEmpty value)? empty,
    TResult? Function(_ChatListLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatListInit value)? init,
    TResult Function(_ChatListData value)? data,
    TResult Function(_ChatListError value)? error,
    TResult Function(_ChatListEmpty value)? empty,
    TResult Function(_ChatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListDataImplToJson(
      this,
    );
  }
}

abstract class _ChatListData extends ChatListState {
  const factory _ChatListData({required final List<User> chatList}) =
      _$ChatListDataImpl;
  const _ChatListData._() : super._();

  factory _ChatListData.fromJson(Map<String, dynamic> json) =
      _$ChatListDataImpl.fromJson;

  List<User> get chatList;
  @JsonKey(ignore: true)
  _$$ChatListDataImplCopyWith<_$ChatListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatListErrorImplCopyWith<$Res> {
  factory _$$ChatListErrorImplCopyWith(
          _$ChatListErrorImpl value, $Res Function(_$ChatListErrorImpl) then) =
      __$$ChatListErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatListErrorImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListErrorImpl>
    implements _$$ChatListErrorImplCopyWith<$Res> {
  __$$ChatListErrorImplCopyWithImpl(
      _$ChatListErrorImpl _value, $Res Function(_$ChatListErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatListErrorImpl extends _ChatListError {
  const _$ChatListErrorImpl({final String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$ChatListErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatListState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatListErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<User> chatList) data,
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
    TResult? Function(List<User> chatList)? data,
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
    TResult Function(List<User> chatList)? data,
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
    required TResult Function(_ChatListInit value) init,
    required TResult Function(_ChatListData value) data,
    required TResult Function(_ChatListError value) error,
    required TResult Function(_ChatListEmpty value) empty,
    required TResult Function(_ChatListLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatListInit value)? init,
    TResult? Function(_ChatListData value)? data,
    TResult? Function(_ChatListError value)? error,
    TResult? Function(_ChatListEmpty value)? empty,
    TResult? Function(_ChatListLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatListInit value)? init,
    TResult Function(_ChatListData value)? data,
    TResult Function(_ChatListError value)? error,
    TResult Function(_ChatListEmpty value)? empty,
    TResult Function(_ChatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListErrorImplToJson(
      this,
    );
  }
}

abstract class _ChatListError extends ChatListState {
  const factory _ChatListError() = _$ChatListErrorImpl;
  const _ChatListError._() : super._();

  factory _ChatListError.fromJson(Map<String, dynamic> json) =
      _$ChatListErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatListEmptyImplCopyWith<$Res> {
  factory _$$ChatListEmptyImplCopyWith(
          _$ChatListEmptyImpl value, $Res Function(_$ChatListEmptyImpl) then) =
      __$$ChatListEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatListEmptyImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListEmptyImpl>
    implements _$$ChatListEmptyImplCopyWith<$Res> {
  __$$ChatListEmptyImplCopyWithImpl(
      _$ChatListEmptyImpl _value, $Res Function(_$ChatListEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatListEmptyImpl extends _ChatListEmpty {
  const _$ChatListEmptyImpl({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$ChatListEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListEmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatListState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatListEmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<User> chatList) data,
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
    TResult? Function(List<User> chatList)? data,
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
    TResult Function(List<User> chatList)? data,
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
    required TResult Function(_ChatListInit value) init,
    required TResult Function(_ChatListData value) data,
    required TResult Function(_ChatListError value) error,
    required TResult Function(_ChatListEmpty value) empty,
    required TResult Function(_ChatListLoading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatListInit value)? init,
    TResult? Function(_ChatListData value)? data,
    TResult? Function(_ChatListError value)? error,
    TResult? Function(_ChatListEmpty value)? empty,
    TResult? Function(_ChatListLoading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatListInit value)? init,
    TResult Function(_ChatListData value)? data,
    TResult Function(_ChatListError value)? error,
    TResult Function(_ChatListEmpty value)? empty,
    TResult Function(_ChatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListEmptyImplToJson(
      this,
    );
  }
}

abstract class _ChatListEmpty extends ChatListState {
  const factory _ChatListEmpty() = _$ChatListEmptyImpl;
  const _ChatListEmpty._() : super._();

  factory _ChatListEmpty.fromJson(Map<String, dynamic> json) =
      _$ChatListEmptyImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatListLoadingImplCopyWith<$Res> {
  factory _$$ChatListLoadingImplCopyWith(_$ChatListLoadingImpl value,
          $Res Function(_$ChatListLoadingImpl) then) =
      __$$ChatListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatListLoadingImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListLoadingImpl>
    implements _$$ChatListLoadingImplCopyWith<$Res> {
  __$$ChatListLoadingImplCopyWithImpl(
      _$ChatListLoadingImpl _value, $Res Function(_$ChatListLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatListLoadingImpl extends _ChatListLoading {
  const _$ChatListLoadingImpl({final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$ChatListLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatListLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatListLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<User> chatList) data,
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
    TResult? Function(List<User> chatList)? data,
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
    TResult Function(List<User> chatList)? data,
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
    required TResult Function(_ChatListInit value) init,
    required TResult Function(_ChatListData value) data,
    required TResult Function(_ChatListError value) error,
    required TResult Function(_ChatListEmpty value) empty,
    required TResult Function(_ChatListLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatListInit value)? init,
    TResult? Function(_ChatListData value)? data,
    TResult? Function(_ChatListError value)? error,
    TResult? Function(_ChatListEmpty value)? empty,
    TResult? Function(_ChatListLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatListInit value)? init,
    TResult Function(_ChatListData value)? data,
    TResult Function(_ChatListError value)? error,
    TResult Function(_ChatListEmpty value)? empty,
    TResult Function(_ChatListLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatListLoadingImplToJson(
      this,
    );
  }
}

abstract class _ChatListLoading extends ChatListState {
  const factory _ChatListLoading() = _$ChatListLoadingImpl;
  const _ChatListLoading._() : super._();

  factory _ChatListLoading.fromJson(Map<String, dynamic> json) =
      _$ChatListLoadingImpl.fromJson;
}
