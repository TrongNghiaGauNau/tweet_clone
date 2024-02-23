// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageState _$MessageStateFromJson(Map<String, dynamic> json) {
  return _MessageState.fromJson(json);
}

/// @nodoc
mixin _$MessageState {
  Message get message => throw _privateConstructorUsedError;
  bool get showSeen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res, MessageState>;
  @useResult
  $Res call({Message message, bool showSeen});

  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res, $Val extends MessageState>
    implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? showSeen = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      showSeen: null == showSeen
          ? _value.showSeen
          : showSeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res> get message {
    return $MessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageStateImplCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$$MessageStateImplCopyWith(
          _$MessageStateImpl value, $Res Function(_$MessageStateImpl) then) =
      __$$MessageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Message message, bool showSeen});

  @override
  $MessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$MessageStateImplCopyWithImpl<$Res>
    extends _$MessageStateCopyWithImpl<$Res, _$MessageStateImpl>
    implements _$$MessageStateImplCopyWith<$Res> {
  __$$MessageStateImplCopyWithImpl(
      _$MessageStateImpl _value, $Res Function(_$MessageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? showSeen = null,
  }) {
    return _then(_$MessageStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as Message,
      showSeen: null == showSeen
          ? _value.showSeen
          : showSeen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageStateImpl implements _MessageState {
  const _$MessageStateImpl({required this.message, this.showSeen = false});

  factory _$MessageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageStateImplFromJson(json);

  @override
  final Message message;
  @override
  @JsonKey()
  final bool showSeen;

  @override
  String toString() {
    return 'MessageState(message: $message, showSeen: $showSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.showSeen, showSeen) ||
                other.showSeen == showSeen));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, showSeen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageStateImplCopyWith<_$MessageStateImpl> get copyWith =>
      __$$MessageStateImplCopyWithImpl<_$MessageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageStateImplToJson(
      this,
    );
  }
}

abstract class _MessageState implements MessageState {
  const factory _MessageState(
      {required final Message message,
      final bool showSeen}) = _$MessageStateImpl;

  factory _MessageState.fromJson(Map<String, dynamic> json) =
      _$MessageStateImpl.fromJson;

  @override
  Message get message;
  @override
  bool get showSeen;
  @override
  @JsonKey(ignore: true)
  _$$MessageStateImplCopyWith<_$MessageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
