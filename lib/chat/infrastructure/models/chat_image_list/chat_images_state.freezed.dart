// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_images_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatImagesState _$ChatImagesStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'init':
      return _ChatImagesInit.fromJson(json);
    case 'data':
      return _ChatImagesData.fromJson(json);
    case 'error':
      return _ChatImagesError.fromJson(json);
    case 'empty':
      return _ChatImagesEmpty.fromJson(json);
    case 'loading':
      return _ChatImagesLoading.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ChatImagesState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ChatImagesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<String> imagesList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<String> imagesList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<String> imagesList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatImagesInit value) init,
    required TResult Function(_ChatImagesData value) data,
    required TResult Function(_ChatImagesError value) error,
    required TResult Function(_ChatImagesEmpty value) empty,
    required TResult Function(_ChatImagesLoading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatImagesInit value)? init,
    TResult? Function(_ChatImagesData value)? data,
    TResult? Function(_ChatImagesError value)? error,
    TResult? Function(_ChatImagesEmpty value)? empty,
    TResult? Function(_ChatImagesLoading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatImagesInit value)? init,
    TResult Function(_ChatImagesData value)? data,
    TResult Function(_ChatImagesError value)? error,
    TResult Function(_ChatImagesEmpty value)? empty,
    TResult Function(_ChatImagesLoading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatImagesStateCopyWith<$Res> {
  factory $ChatImagesStateCopyWith(
          ChatImagesState value, $Res Function(ChatImagesState) then) =
      _$ChatImagesStateCopyWithImpl<$Res, ChatImagesState>;
}

/// @nodoc
class _$ChatImagesStateCopyWithImpl<$Res, $Val extends ChatImagesState>
    implements $ChatImagesStateCopyWith<$Res> {
  _$ChatImagesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChatImagesInitImplCopyWith<$Res> {
  factory _$$ChatImagesInitImplCopyWith(_$ChatImagesInitImpl value,
          $Res Function(_$ChatImagesInitImpl) then) =
      __$$ChatImagesInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatImagesInitImplCopyWithImpl<$Res>
    extends _$ChatImagesStateCopyWithImpl<$Res, _$ChatImagesInitImpl>
    implements _$$ChatImagesInitImplCopyWith<$Res> {
  __$$ChatImagesInitImplCopyWithImpl(
      _$ChatImagesInitImpl _value, $Res Function(_$ChatImagesInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatImagesInitImpl extends _ChatImagesInit {
  const _$ChatImagesInitImpl({final String? $type})
      : $type = $type ?? 'init',
        super._();

  factory _$ChatImagesInitImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImagesInitImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatImagesState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatImagesInitImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<String> imagesList) data,
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
    TResult? Function(List<String> imagesList)? data,
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
    TResult Function(List<String> imagesList)? data,
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
    required TResult Function(_ChatImagesInit value) init,
    required TResult Function(_ChatImagesData value) data,
    required TResult Function(_ChatImagesError value) error,
    required TResult Function(_ChatImagesEmpty value) empty,
    required TResult Function(_ChatImagesLoading value) loading,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatImagesInit value)? init,
    TResult? Function(_ChatImagesData value)? data,
    TResult? Function(_ChatImagesError value)? error,
    TResult? Function(_ChatImagesEmpty value)? empty,
    TResult? Function(_ChatImagesLoading value)? loading,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatImagesInit value)? init,
    TResult Function(_ChatImagesData value)? data,
    TResult Function(_ChatImagesError value)? error,
    TResult Function(_ChatImagesEmpty value)? empty,
    TResult Function(_ChatImagesLoading value)? loading,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImagesInitImplToJson(
      this,
    );
  }
}

abstract class _ChatImagesInit extends ChatImagesState {
  const factory _ChatImagesInit() = _$ChatImagesInitImpl;
  const _ChatImagesInit._() : super._();

  factory _ChatImagesInit.fromJson(Map<String, dynamic> json) =
      _$ChatImagesInitImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatImagesDataImplCopyWith<$Res> {
  factory _$$ChatImagesDataImplCopyWith(_$ChatImagesDataImpl value,
          $Res Function(_$ChatImagesDataImpl) then) =
      __$$ChatImagesDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> imagesList});
}

/// @nodoc
class __$$ChatImagesDataImplCopyWithImpl<$Res>
    extends _$ChatImagesStateCopyWithImpl<$Res, _$ChatImagesDataImpl>
    implements _$$ChatImagesDataImplCopyWith<$Res> {
  __$$ChatImagesDataImplCopyWithImpl(
      _$ChatImagesDataImpl _value, $Res Function(_$ChatImagesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imagesList = null,
  }) {
    return _then(_$ChatImagesDataImpl(
      imagesList: null == imagesList
          ? _value._imagesList
          : imagesList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatImagesDataImpl extends _ChatImagesData {
  const _$ChatImagesDataImpl(
      {required final List<String> imagesList, final String? $type})
      : _imagesList = imagesList,
        $type = $type ?? 'data',
        super._();

  factory _$ChatImagesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImagesDataImplFromJson(json);

  final List<String> _imagesList;
  @override
  List<String> get imagesList {
    if (_imagesList is EqualUnmodifiableListView) return _imagesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesList);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatImagesState.data(imagesList: $imagesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImagesDataImpl &&
            const DeepCollectionEquality()
                .equals(other._imagesList, _imagesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_imagesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImagesDataImplCopyWith<_$ChatImagesDataImpl> get copyWith =>
      __$$ChatImagesDataImplCopyWithImpl<_$ChatImagesDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<String> imagesList) data,
    required TResult Function() error,
    required TResult Function() empty,
    required TResult Function() loading,
  }) {
    return data(imagesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(List<String> imagesList)? data,
    TResult? Function()? error,
    TResult? Function()? empty,
    TResult? Function()? loading,
  }) {
    return data?.call(imagesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<String> imagesList)? data,
    TResult Function()? error,
    TResult Function()? empty,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(imagesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChatImagesInit value) init,
    required TResult Function(_ChatImagesData value) data,
    required TResult Function(_ChatImagesError value) error,
    required TResult Function(_ChatImagesEmpty value) empty,
    required TResult Function(_ChatImagesLoading value) loading,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatImagesInit value)? init,
    TResult? Function(_ChatImagesData value)? data,
    TResult? Function(_ChatImagesError value)? error,
    TResult? Function(_ChatImagesEmpty value)? empty,
    TResult? Function(_ChatImagesLoading value)? loading,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatImagesInit value)? init,
    TResult Function(_ChatImagesData value)? data,
    TResult Function(_ChatImagesError value)? error,
    TResult Function(_ChatImagesEmpty value)? empty,
    TResult Function(_ChatImagesLoading value)? loading,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImagesDataImplToJson(
      this,
    );
  }
}

abstract class _ChatImagesData extends ChatImagesState {
  const factory _ChatImagesData({required final List<String> imagesList}) =
      _$ChatImagesDataImpl;
  const _ChatImagesData._() : super._();

  factory _ChatImagesData.fromJson(Map<String, dynamic> json) =
      _$ChatImagesDataImpl.fromJson;

  List<String> get imagesList;
  @JsonKey(ignore: true)
  _$$ChatImagesDataImplCopyWith<_$ChatImagesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatImagesErrorImplCopyWith<$Res> {
  factory _$$ChatImagesErrorImplCopyWith(_$ChatImagesErrorImpl value,
          $Res Function(_$ChatImagesErrorImpl) then) =
      __$$ChatImagesErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatImagesErrorImplCopyWithImpl<$Res>
    extends _$ChatImagesStateCopyWithImpl<$Res, _$ChatImagesErrorImpl>
    implements _$$ChatImagesErrorImplCopyWith<$Res> {
  __$$ChatImagesErrorImplCopyWithImpl(
      _$ChatImagesErrorImpl _value, $Res Function(_$ChatImagesErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatImagesErrorImpl extends _ChatImagesError {
  const _$ChatImagesErrorImpl({final String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$ChatImagesErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImagesErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatImagesState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatImagesErrorImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<String> imagesList) data,
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
    TResult? Function(List<String> imagesList)? data,
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
    TResult Function(List<String> imagesList)? data,
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
    required TResult Function(_ChatImagesInit value) init,
    required TResult Function(_ChatImagesData value) data,
    required TResult Function(_ChatImagesError value) error,
    required TResult Function(_ChatImagesEmpty value) empty,
    required TResult Function(_ChatImagesLoading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatImagesInit value)? init,
    TResult? Function(_ChatImagesData value)? data,
    TResult? Function(_ChatImagesError value)? error,
    TResult? Function(_ChatImagesEmpty value)? empty,
    TResult? Function(_ChatImagesLoading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatImagesInit value)? init,
    TResult Function(_ChatImagesData value)? data,
    TResult Function(_ChatImagesError value)? error,
    TResult Function(_ChatImagesEmpty value)? empty,
    TResult Function(_ChatImagesLoading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImagesErrorImplToJson(
      this,
    );
  }
}

abstract class _ChatImagesError extends ChatImagesState {
  const factory _ChatImagesError() = _$ChatImagesErrorImpl;
  const _ChatImagesError._() : super._();

  factory _ChatImagesError.fromJson(Map<String, dynamic> json) =
      _$ChatImagesErrorImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatImagesEmptyImplCopyWith<$Res> {
  factory _$$ChatImagesEmptyImplCopyWith(_$ChatImagesEmptyImpl value,
          $Res Function(_$ChatImagesEmptyImpl) then) =
      __$$ChatImagesEmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatImagesEmptyImplCopyWithImpl<$Res>
    extends _$ChatImagesStateCopyWithImpl<$Res, _$ChatImagesEmptyImpl>
    implements _$$ChatImagesEmptyImplCopyWith<$Res> {
  __$$ChatImagesEmptyImplCopyWithImpl(
      _$ChatImagesEmptyImpl _value, $Res Function(_$ChatImagesEmptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatImagesEmptyImpl extends _ChatImagesEmpty {
  const _$ChatImagesEmptyImpl({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$ChatImagesEmptyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImagesEmptyImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatImagesState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatImagesEmptyImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<String> imagesList) data,
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
    TResult? Function(List<String> imagesList)? data,
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
    TResult Function(List<String> imagesList)? data,
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
    required TResult Function(_ChatImagesInit value) init,
    required TResult Function(_ChatImagesData value) data,
    required TResult Function(_ChatImagesError value) error,
    required TResult Function(_ChatImagesEmpty value) empty,
    required TResult Function(_ChatImagesLoading value) loading,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatImagesInit value)? init,
    TResult? Function(_ChatImagesData value)? data,
    TResult? Function(_ChatImagesError value)? error,
    TResult? Function(_ChatImagesEmpty value)? empty,
    TResult? Function(_ChatImagesLoading value)? loading,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatImagesInit value)? init,
    TResult Function(_ChatImagesData value)? data,
    TResult Function(_ChatImagesError value)? error,
    TResult Function(_ChatImagesEmpty value)? empty,
    TResult Function(_ChatImagesLoading value)? loading,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImagesEmptyImplToJson(
      this,
    );
  }
}

abstract class _ChatImagesEmpty extends ChatImagesState {
  const factory _ChatImagesEmpty() = _$ChatImagesEmptyImpl;
  const _ChatImagesEmpty._() : super._();

  factory _ChatImagesEmpty.fromJson(Map<String, dynamic> json) =
      _$ChatImagesEmptyImpl.fromJson;
}

/// @nodoc
abstract class _$$ChatImagesLoadingImplCopyWith<$Res> {
  factory _$$ChatImagesLoadingImplCopyWith(_$ChatImagesLoadingImpl value,
          $Res Function(_$ChatImagesLoadingImpl) then) =
      __$$ChatImagesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatImagesLoadingImplCopyWithImpl<$Res>
    extends _$ChatImagesStateCopyWithImpl<$Res, _$ChatImagesLoadingImpl>
    implements _$$ChatImagesLoadingImplCopyWith<$Res> {
  __$$ChatImagesLoadingImplCopyWithImpl(_$ChatImagesLoadingImpl _value,
      $Res Function(_$ChatImagesLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$ChatImagesLoadingImpl extends _ChatImagesLoading {
  const _$ChatImagesLoadingImpl({final String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$ChatImagesLoadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImagesLoadingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ChatImagesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ChatImagesLoadingImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(List<String> imagesList) data,
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
    TResult? Function(List<String> imagesList)? data,
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
    TResult Function(List<String> imagesList)? data,
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
    required TResult Function(_ChatImagesInit value) init,
    required TResult Function(_ChatImagesData value) data,
    required TResult Function(_ChatImagesError value) error,
    required TResult Function(_ChatImagesEmpty value) empty,
    required TResult Function(_ChatImagesLoading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChatImagesInit value)? init,
    TResult? Function(_ChatImagesData value)? data,
    TResult? Function(_ChatImagesError value)? error,
    TResult? Function(_ChatImagesEmpty value)? empty,
    TResult? Function(_ChatImagesLoading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChatImagesInit value)? init,
    TResult Function(_ChatImagesData value)? data,
    TResult Function(_ChatImagesError value)? error,
    TResult Function(_ChatImagesEmpty value)? empty,
    TResult Function(_ChatImagesLoading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImagesLoadingImplToJson(
      this,
    );
  }
}

abstract class _ChatImagesLoading extends ChatImagesState {
  const factory _ChatImagesLoading() = _$ChatImagesLoadingImpl;
  const _ChatImagesLoading._() : super._();

  factory _ChatImagesLoading.fromJson(Map<String, dynamic> json) =
      _$ChatImagesLoadingImpl.fromJson;
}
