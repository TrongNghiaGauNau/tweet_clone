// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatState _$ChatStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return _ChatInit.fromJson(json);
    case 'data':
      return _ChatData.fromJson(json);
    case 'error':
      return _ChatError.fromJson(json);
    case 'empty':
      return _ChatEmpty.fromJson(json);
    case 'loading':
      return _ChatLoading.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChatState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Message> messageList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<Message> messageList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Message> messageList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatInit value) init,
    required TResult Function(_ChatData value) data,
    required TResult Function(_ChatError value) error,
    required TResult Function(_ChatEmpty value) empty,
    required TResult Function(_ChatLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInit value)? init,
    TResult? Function(_ChatData value)? data,
    TResult? Function(_ChatError value)? error,
    TResult? Function(_ChatEmpty value)? empty,
    TResult? Function(_ChatLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInit value)? init,
    TResult Function(_ChatData value)? data,
    TResult Function(_ChatError value)? error,
    TResult Function(_ChatEmpty value)? empty,
    TResult Function(_ChatLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatInitImplCopyWith<$Res> {
  factory _$$ChatInitImplCopyWith(
          _$ChatInitImpl value, $Res Function(_$ChatInitImpl) then) =
      __$$ChatInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatInitImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatInitImpl>
    implements _$$ChatInitImplCopyWith<$Res> {
  __$$ChatInitImplCopyWithImpl(
      _$ChatInitImpl _value, $Res Function(_$ChatInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatInitImpl extends _ChatInit {
  const _$ChatInitImpl({final String? $type})
      : $type = $type ?? 'init',
        super._();

  factory _$ChatInitImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatInitImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatInitImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Message> messageList) data,
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
    TResult? Function(List<Message> messageList)? data,
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
    TResult Function(List<Message> messageList)? data,
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
    required TResult Function(_ChatInit value) init,
    required TResult Function(_ChatData value) data,
    required TResult Function(_ChatError value) error,
    required TResult Function(_ChatEmpty value) empty,
    required TResult Function(_ChatLoading value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInit value)? init,
    TResult? Function(_ChatData value)? data,
    TResult? Function(_ChatError value)? error,
    TResult? Function(_ChatEmpty value)? empty,
    TResult? Function(_ChatLoading value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInit value)? init,
    TResult Function(_ChatData value)? data,
    TResult Function(_ChatError value)? error,
    TResult Function(_ChatEmpty value)? empty,
    TResult Function(_ChatLoading value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatInitImplToJson(
      this,
    );
  }
}

abstract class _ChatInit extends ChatState {
  const factory _ChatInit() = _$ChatInitImpl;
  const _ChatInit._() : super._();

  factory _ChatInit.fromJson(Map<String, dynamic> json) =
      _$ChatInitImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatDataImplCopyWith<$Res> {
  factory _$$ChatDataImplCopyWith(
          _$ChatDataImpl value, $Res Function(_$ChatDataImpl) then) =
      __$$ChatDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Message> messageList});
}

/// @nodoc
class __$$ChatDataImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatDataImpl>
    implements _$$ChatDataImplCopyWith<$Res> {
  __$$ChatDataImplCopyWithImpl(
      _$ChatDataImpl _value, $Res Function(_$ChatDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
  }) {
    return _then(_$ChatDataImpl(
      messageList: null == messageList
          ? _value._messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDataImpl extends _ChatData {
  const _$ChatDataImpl(
      {required final List<Message> messageList, final String? $type})
      : _messageList = messageList,
        $type = $type ?? 'data',
        super._();

  factory _$ChatDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDataImplFromJson(json);

  final List<Message> _messageList;
  @override
  List<Message> get messageList {
    if (_messageList is EqualUnmodifiableListView) return _messageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageList);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatState.data(messageList: $messageList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDataImpl &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messageList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      __$$ChatDataImplCopyWithImpl<_$ChatDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Message> messageList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return data(messageList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<Message> messageList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return data?.call(messageList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<Message> messageList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(messageList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatInit value) init,
    required TResult Function(_ChatData value) data,
    required TResult Function(_ChatError value) error,
    required TResult Function(_ChatEmpty value) empty,
    required TResult Function(_ChatLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInit value)? init,
    TResult? Function(_ChatData value)? data,
    TResult? Function(_ChatError value)? error,
    TResult? Function(_ChatEmpty value)? empty,
    TResult? Function(_ChatLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInit value)? init,
    TResult Function(_ChatData value)? data,
    TResult Function(_ChatError value)? error,
    TResult Function(_ChatEmpty value)? empty,
    TResult Function(_ChatLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDataImplToJson(
      this,
    );
  }
}

abstract class _ChatData extends ChatState {
  const factory _ChatData({required final List<Message> messageList}) =
      _$ChatDataImpl;
  const _ChatData._() : super._();

  factory _ChatData.fromJson(Map<String, dynamic> json) =
      _$ChatDataImpl.fromJson;

  List<Message> get messageList;
  @JsonKey(ignore: true)
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatErrorImplCopyWith<$Res> {
  factory _$$ChatErrorImplCopyWith(
          _$ChatErrorImpl value, $Res Function(_$ChatErrorImpl) then) =
      __$$ChatErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatErrorImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatErrorImpl>
    implements _$$ChatErrorImplCopyWith<$Res> {
  __$$ChatErrorImplCopyWithImpl(
      _$ChatErrorImpl _value, $Res Function(_$ChatErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatErrorImpl extends _ChatError {
  const _$ChatErrorImpl({final String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$ChatErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Message> messageList) data,
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
    TResult? Function(List<Message> messageList)? data,
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
    TResult Function(List<Message> messageList)? data,
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
    required TResult Function(_ChatInit value) init,
    required TResult Function(_ChatData value) data,
    required TResult Function(_ChatError value) error,
    required TResult Function(_ChatEmpty value) empty,
    required TResult Function(_ChatLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInit value)? init,
    TResult? Function(_ChatData value)? data,
    TResult? Function(_ChatError value)? error,
    TResult? Function(_ChatEmpty value)? empty,
    TResult? Function(_ChatLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInit value)? init,
    TResult Function(_ChatData value)? data,
    TResult Function(_ChatError value)? error,
    TResult Function(_ChatEmpty value)? empty,
    TResult Function(_ChatLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatErrorImplToJson(
      this,
    );
  }
}

abstract class _ChatError extends ChatState {
  const factory _ChatError() = _$ChatErrorImpl;
  const _ChatError._() : super._();

  factory _ChatError.fromJson(Map<String, dynamic> json) =
      _$ChatErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatEmptyImplCopyWith<$Res> {
  factory _$$ChatEmptyImplCopyWith(
          _$ChatEmptyImpl value, $Res Function(_$ChatEmptyImpl) then) =
      __$$ChatEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatEmptyImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatEmptyImpl>
    implements _$$ChatEmptyImplCopyWith<$Res> {
  __$$ChatEmptyImplCopyWithImpl(
      _$ChatEmptyImpl _value, $Res Function(_$ChatEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatEmptyImpl extends _ChatEmpty {
  const _$ChatEmptyImpl({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$ChatEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatEmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatEmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Message> messageList) data,
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
    TResult? Function(List<Message> messageList)? data,
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
    TResult Function(List<Message> messageList)? data,
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
    required TResult Function(_ChatInit value) init,
    required TResult Function(_ChatData value) data,
    required TResult Function(_ChatError value) error,
    required TResult Function(_ChatEmpty value) empty,
    required TResult Function(_ChatLoading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInit value)? init,
    TResult? Function(_ChatData value)? data,
    TResult? Function(_ChatError value)? error,
    TResult? Function(_ChatEmpty value)? empty,
    TResult? Function(_ChatLoading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInit value)? init,
    TResult Function(_ChatData value)? data,
    TResult Function(_ChatError value)? error,
    TResult Function(_ChatEmpty value)? empty,
    TResult Function(_ChatLoading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatEmptyImplToJson(
      this,
    );
  }
}

abstract class _ChatEmpty extends ChatState {
  const factory _ChatEmpty() = _$ChatEmptyImpl;
  const _ChatEmpty._() : super._();

  factory _ChatEmpty.fromJson(Map<String, dynamic> json) =
      _$ChatEmptyImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatLoadingImplCopyWith<$Res> {
  factory _$$ChatLoadingImplCopyWith(
          _$ChatLoadingImpl value, $Res Function(_$ChatLoadingImpl) then) =
      __$$ChatLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatLoadingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$ChatLoadingImpl>
    implements _$$ChatLoadingImplCopyWith<$Res> {
  __$$ChatLoadingImplCopyWithImpl(
      _$ChatLoadingImpl _value, $Res Function(_$ChatLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatLoadingImpl extends _ChatLoading {
  const _$ChatLoadingImpl({final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$ChatLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<Message> messageList) data,
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
    TResult? Function(List<Message> messageList)? data,
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
    TResult Function(List<Message> messageList)? data,
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
    required TResult Function(_ChatInit value) init,
    required TResult Function(_ChatData value) data,
    required TResult Function(_ChatError value) error,
    required TResult Function(_ChatEmpty value) empty,
    required TResult Function(_ChatLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatInit value)? init,
    TResult? Function(_ChatData value)? data,
    TResult? Function(_ChatError value)? error,
    TResult? Function(_ChatEmpty value)? empty,
    TResult? Function(_ChatLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatInit value)? init,
    TResult Function(_ChatData value)? data,
    TResult Function(_ChatError value)? error,
    TResult Function(_ChatEmpty value)? empty,
    TResult Function(_ChatLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatLoadingImplToJson(
      this,
    );
  }
}

abstract class _ChatLoading extends ChatState {
  const factory _ChatLoading() = _$ChatLoadingImpl;
  const _ChatLoading._() : super._();

  factory _ChatLoading.fromJson(Map<String, dynamic> json) =
      _$ChatLoadingImpl.fromJson;
}
