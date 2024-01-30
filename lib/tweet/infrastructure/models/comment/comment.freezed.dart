// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get text => throw _privateConstructorUsedError;
  List<String>? get hashTags => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  List<String>? get imagesLink => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<String>? get likes => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get repliedTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String text,
      List<String>? hashTags,
      String? link,
      List<String>? imagesLink,
      String uid,
      String createdAt,
      List<String>? likes,
      String id,
      String? repliedTo});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hashTags = freezed,
    Object? link = freezed,
    Object? imagesLink = freezed,
    Object? uid = null,
    Object? createdAt = null,
    Object? likes = freezed,
    Object? id = null,
    Object? repliedTo = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: freezed == hashTags
          ? _value.hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesLink: freezed == imagesLink
          ? _value.imagesLink
          : imagesLink // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repliedTo: freezed == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      List<String>? hashTags,
      String? link,
      List<String>? imagesLink,
      String uid,
      String createdAt,
      List<String>? likes,
      String id,
      String? repliedTo});
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hashTags = freezed,
    Object? link = freezed,
    Object? imagesLink = freezed,
    Object? uid = null,
    Object? createdAt = null,
    Object? likes = freezed,
    Object? id = null,
    Object? repliedTo = freezed,
  }) {
    return _then(_$CommentImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: freezed == hashTags
          ? _value._hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesLink: freezed == imagesLink
          ? _value._imagesLink
          : imagesLink // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      likes: freezed == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repliedTo: freezed == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.text,
      required final List<String>? hashTags,
      required this.link,
      required final List<String>? imagesLink,
      required this.uid,
      required this.createdAt,
      required final List<String>? likes,
      required this.id,
      required this.repliedTo})
      : _hashTags = hashTags,
        _imagesLink = imagesLink,
        _likes = likes;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String text;
  final List<String>? _hashTags;
  @override
  List<String>? get hashTags {
    final value = _hashTags;
    if (value == null) return null;
    if (_hashTags is EqualUnmodifiableListView) return _hashTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? link;
  final List<String>? _imagesLink;
  @override
  List<String>? get imagesLink {
    final value = _imagesLink;
    if (value == null) return null;
    if (_imagesLink is EqualUnmodifiableListView) return _imagesLink;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String uid;
  @override
  final String createdAt;
  final List<String>? _likes;
  @override
  List<String>? get likes {
    final value = _likes;
    if (value == null) return null;
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String id;
  @override
  final String? repliedTo;

  @override
  String toString() {
    return 'Comment(text: $text, hashTags: $hashTags, link: $link, imagesLink: $imagesLink, uid: $uid, createdAt: $createdAt, likes: $likes, id: $id, repliedTo: $repliedTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._hashTags, _hashTags) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._imagesLink, _imagesLink) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repliedTo, repliedTo) ||
                other.repliedTo == repliedTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      const DeepCollectionEquality().hash(_hashTags),
      link,
      const DeepCollectionEquality().hash(_imagesLink),
      uid,
      createdAt,
      const DeepCollectionEquality().hash(_likes),
      id,
      repliedTo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String text,
      required final List<String>? hashTags,
      required final String? link,
      required final List<String>? imagesLink,
      required final String uid,
      required final String createdAt,
      required final List<String>? likes,
      required final String id,
      required final String? repliedTo}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get text;
  @override
  List<String>? get hashTags;
  @override
  String? get link;
  @override
  List<String>? get imagesLink;
  @override
  String get uid;
  @override
  String get createdAt;
  @override
  List<String>? get likes;
  @override
  String get id;
  @override
  String? get repliedTo;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
