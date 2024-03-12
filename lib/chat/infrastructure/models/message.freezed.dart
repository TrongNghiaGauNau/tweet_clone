// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get sentAt => throw _privateConstructorUsedError;
  List<String> get imagesIdList => throw _privateConstructorUsedError;
  bool get seen => throw _privateConstructorUsedError;
  Map<String, dynamic>? get replyMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String id,
      String receiverId,
      String senderId,
      String message,
      String sentAt,
      List<String> imagesIdList,
      bool seen,
      Map<String, dynamic>? replyMessage});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiverId = null,
    Object? senderId = null,
    Object? message = null,
    Object? sentAt = null,
    Object? imagesIdList = null,
    Object? seen = null,
    Object? replyMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String,
      imagesIdList: null == imagesIdList
          ? _value.imagesIdList
          : imagesIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      replyMessage: freezed == replyMessage
          ? _value.replyMessage
          : replyMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String receiverId,
      String senderId,
      String message,
      String sentAt,
      List<String> imagesIdList,
      bool seen,
      Map<String, dynamic>? replyMessage});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiverId = null,
    Object? senderId = null,
    Object? message = null,
    Object? sentAt = null,
    Object? imagesIdList = null,
    Object? seen = null,
    Object? replyMessage = freezed,
  }) {
    return _then(_$MessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as String,
      imagesIdList: null == imagesIdList
          ? _value._imagesIdList
          : imagesIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      seen: null == seen
          ? _value.seen
          : seen // ignore: cast_nullable_to_non_nullable
              as bool,
      replyMessage: freezed == replyMessage
          ? _value._replyMessage
          : replyMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {required this.id,
      required this.receiverId,
      required this.senderId,
      required this.message,
      required this.sentAt,
      final List<String> imagesIdList = const [],
      this.seen = false,
      final Map<String, dynamic>? replyMessage})
      : _imagesIdList = imagesIdList,
        _replyMessage = replyMessage;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final String receiverId;
  @override
  final String senderId;
  @override
  final String message;
  @override
  final String sentAt;
  final List<String> _imagesIdList;
  @override
  @JsonKey()
  List<String> get imagesIdList {
    if (_imagesIdList is EqualUnmodifiableListView) return _imagesIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesIdList);
  }

  @override
  @JsonKey()
  final bool seen;
  final Map<String, dynamic>? _replyMessage;
  @override
  Map<String, dynamic>? get replyMessage {
    final value = _replyMessage;
    if (value == null) return null;
    if (_replyMessage is EqualUnmodifiableMapView) return _replyMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Message(id: $id, receiverId: $receiverId, senderId: $senderId, message: $message, sentAt: $sentAt, imagesIdList: $imagesIdList, seen: $seen, replyMessage: $replyMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            const DeepCollectionEquality()
                .equals(other._imagesIdList, _imagesIdList) &&
            (identical(other.seen, seen) || other.seen == seen) &&
            const DeepCollectionEquality()
                .equals(other._replyMessage, _replyMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      receiverId,
      senderId,
      message,
      sentAt,
      const DeepCollectionEquality().hash(_imagesIdList),
      seen,
      const DeepCollectionEquality().hash(_replyMessage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {required final String id,
      required final String receiverId,
      required final String senderId,
      required final String message,
      required final String sentAt,
      final List<String> imagesIdList,
      final bool seen,
      final Map<String, dynamic>? replyMessage}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  String get receiverId;
  @override
  String get senderId;
  @override
  String get message;
  @override
  String get sentAt;
  @override
  List<String> get imagesIdList;
  @override
  bool get seen;
  @override
  Map<String, dynamic>? get replyMessage;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
