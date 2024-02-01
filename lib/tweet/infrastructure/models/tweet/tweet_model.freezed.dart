// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return _Tweet.fromJson(json);
}

/// @nodoc
mixin _$Tweet {
  String get text => throw _privateConstructorUsedError;
  List<String> get hashTags => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  List<String> get imagesLink => throw _privateConstructorUsedError;
  String get tweetType => throw _privateConstructorUsedError;
  String get tweetedAt => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  List<String> get commentsIds => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get reshareCount => throw _privateConstructorUsedError;
  String get retweetedBy => throw _privateConstructorUsedError;
  String get repliedTo => throw _privateConstructorUsedError;
  Map<String, String> get tweetCreator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCopyWith<Tweet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCopyWith<$Res> {
  factory $TweetCopyWith(Tweet value, $Res Function(Tweet) then) =
      _$TweetCopyWithImpl<$Res, Tweet>;
  @useResult
  $Res call(
      {String text,
      List<String> hashTags,
      String link,
      List<String> imagesLink,
      String tweetType,
      String tweetedAt,
      List<String> likes,
      List<String> commentsIds,
      String id,
      int reshareCount,
      String retweetedBy,
      String repliedTo,
      Map<String, String> tweetCreator});
}

/// @nodoc
class _$TweetCopyWithImpl<$Res, $Val extends Tweet>
    implements $TweetCopyWith<$Res> {
  _$TweetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hashTags = null,
    Object? link = null,
    Object? imagesLink = null,
    Object? tweetType = null,
    Object? tweetedAt = null,
    Object? likes = null,
    Object? commentsIds = null,
    Object? id = null,
    Object? reshareCount = null,
    Object? retweetedBy = null,
    Object? repliedTo = null,
    Object? tweetCreator = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: null == hashTags
          ? _value.hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imagesLink: null == imagesLink
          ? _value.imagesLink
          : imagesLink // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tweetType: null == tweetType
          ? _value.tweetType
          : tweetType // ignore: cast_nullable_to_non_nullable
              as String,
      tweetedAt: null == tweetedAt
          ? _value.tweetedAt
          : tweetedAt // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentsIds: null == commentsIds
          ? _value.commentsIds
          : commentsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reshareCount: null == reshareCount
          ? _value.reshareCount
          : reshareCount // ignore: cast_nullable_to_non_nullable
              as int,
      retweetedBy: null == retweetedBy
          ? _value.retweetedBy
          : retweetedBy // ignore: cast_nullable_to_non_nullable
              as String,
      repliedTo: null == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String,
      tweetCreator: null == tweetCreator
          ? _value.tweetCreator
          : tweetCreator // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TweetImplCopyWith<$Res> implements $TweetCopyWith<$Res> {
  factory _$$TweetImplCopyWith(
          _$TweetImpl value, $Res Function(_$TweetImpl) then) =
      __$$TweetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String text,
      List<String> hashTags,
      String link,
      List<String> imagesLink,
      String tweetType,
      String tweetedAt,
      List<String> likes,
      List<String> commentsIds,
      String id,
      int reshareCount,
      String retweetedBy,
      String repliedTo,
      Map<String, String> tweetCreator});
}

/// @nodoc
class __$$TweetImplCopyWithImpl<$Res>
    extends _$TweetCopyWithImpl<$Res, _$TweetImpl>
    implements _$$TweetImplCopyWith<$Res> {
  __$$TweetImplCopyWithImpl(
      _$TweetImpl _value, $Res Function(_$TweetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hashTags = null,
    Object? link = null,
    Object? imagesLink = null,
    Object? tweetType = null,
    Object? tweetedAt = null,
    Object? likes = null,
    Object? commentsIds = null,
    Object? id = null,
    Object? reshareCount = null,
    Object? retweetedBy = null,
    Object? repliedTo = null,
    Object? tweetCreator = null,
  }) {
    return _then(_$TweetImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: null == hashTags
          ? _value._hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imagesLink: null == imagesLink
          ? _value._imagesLink
          : imagesLink // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tweetType: null == tweetType
          ? _value.tweetType
          : tweetType // ignore: cast_nullable_to_non_nullable
              as String,
      tweetedAt: null == tweetedAt
          ? _value.tweetedAt
          : tweetedAt // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      commentsIds: null == commentsIds
          ? _value._commentsIds
          : commentsIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reshareCount: null == reshareCount
          ? _value.reshareCount
          : reshareCount // ignore: cast_nullable_to_non_nullable
              as int,
      retweetedBy: null == retweetedBy
          ? _value.retweetedBy
          : retweetedBy // ignore: cast_nullable_to_non_nullable
              as String,
      repliedTo: null == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String,
      tweetCreator: null == tweetCreator
          ? _value._tweetCreator
          : tweetCreator // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TweetImpl implements _Tweet {
  const _$TweetImpl(
      {required this.text,
      required final List<String> hashTags,
      required this.link,
      required final List<String> imagesLink,
      required this.tweetType,
      required this.tweetedAt,
      required final List<String> likes,
      required final List<String> commentsIds,
      required this.id,
      required this.reshareCount,
      required this.retweetedBy,
      required this.repliedTo,
      required final Map<String, String> tweetCreator})
      : _hashTags = hashTags,
        _imagesLink = imagesLink,
        _likes = likes,
        _commentsIds = commentsIds,
        _tweetCreator = tweetCreator;

  factory _$TweetImpl.fromJson(Map<String, dynamic> json) =>
      _$$TweetImplFromJson(json);

  @override
  final String text;
  final List<String> _hashTags;
  @override
  List<String> get hashTags {
    if (_hashTags is EqualUnmodifiableListView) return _hashTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashTags);
  }

  @override
  final String link;
  final List<String> _imagesLink;
  @override
  List<String> get imagesLink {
    if (_imagesLink is EqualUnmodifiableListView) return _imagesLink;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imagesLink);
  }

  @override
  final String tweetType;
  @override
  final String tweetedAt;
  final List<String> _likes;
  @override
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<String> _commentsIds;
  @override
  List<String> get commentsIds {
    if (_commentsIds is EqualUnmodifiableListView) return _commentsIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentsIds);
  }

  @override
  final String id;
  @override
  final int reshareCount;
  @override
  final String retweetedBy;
  @override
  final String repliedTo;
  final Map<String, String> _tweetCreator;
  @override
  Map<String, String> get tweetCreator {
    if (_tweetCreator is EqualUnmodifiableMapView) return _tweetCreator;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_tweetCreator);
  }

  @override
  String toString() {
    return 'Tweet(text: $text, hashTags: $hashTags, link: $link, imagesLink: $imagesLink, tweetType: $tweetType, tweetedAt: $tweetedAt, likes: $likes, commentsIds: $commentsIds, id: $id, reshareCount: $reshareCount, retweetedBy: $retweetedBy, repliedTo: $repliedTo, tweetCreator: $tweetCreator)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TweetImpl &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._hashTags, _hashTags) &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality()
                .equals(other._imagesLink, _imagesLink) &&
            (identical(other.tweetType, tweetType) ||
                other.tweetType == tweetType) &&
            (identical(other.tweetedAt, tweetedAt) ||
                other.tweetedAt == tweetedAt) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality()
                .equals(other._commentsIds, _commentsIds) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reshareCount, reshareCount) ||
                other.reshareCount == reshareCount) &&
            (identical(other.retweetedBy, retweetedBy) ||
                other.retweetedBy == retweetedBy) &&
            (identical(other.repliedTo, repliedTo) ||
                other.repliedTo == repliedTo) &&
            const DeepCollectionEquality()
                .equals(other._tweetCreator, _tweetCreator));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      text,
      const DeepCollectionEquality().hash(_hashTags),
      link,
      const DeepCollectionEquality().hash(_imagesLink),
      tweetType,
      tweetedAt,
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_commentsIds),
      id,
      reshareCount,
      retweetedBy,
      repliedTo,
      const DeepCollectionEquality().hash(_tweetCreator));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TweetImplCopyWith<_$TweetImpl> get copyWith =>
      __$$TweetImplCopyWithImpl<_$TweetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TweetImplToJson(
      this,
    );
  }
}

abstract class _Tweet implements Tweet {
  const factory _Tweet(
      {required final String text,
      required final List<String> hashTags,
      required final String link,
      required final List<String> imagesLink,
      required final String tweetType,
      required final String tweetedAt,
      required final List<String> likes,
      required final List<String> commentsIds,
      required final String id,
      required final int reshareCount,
      required final String retweetedBy,
      required final String repliedTo,
      required final Map<String, String> tweetCreator}) = _$TweetImpl;

  factory _Tweet.fromJson(Map<String, dynamic> json) = _$TweetImpl.fromJson;

  @override
  String get text;
  @override
  List<String> get hashTags;
  @override
  String get link;
  @override
  List<String> get imagesLink;
  @override
  String get tweetType;
  @override
  String get tweetedAt;
  @override
  List<String> get likes;
  @override
  List<String> get commentsIds;
  @override
  String get id;
  @override
  int get reshareCount;
  @override
  String get retweetedBy;
  @override
  String get repliedTo;
  @override
  Map<String, String> get tweetCreator;
  @override
  @JsonKey(ignore: true)
  _$$TweetImplCopyWith<_$TweetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
