// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get followers => throw _privateConstructorUsedError;
  List<String> get following => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get bannerPic => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  bool get isTwitterBlue => throw _privateConstructorUsedError;
  String get lastActive => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String email,
      String name,
      List<String> followers,
      List<String> following,
      String profilePic,
      String bannerPic,
      String uid,
      String bio,
      bool isTwitterBlue,
      String lastActive,
      bool isOnline,
      String? fcmToken});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? followers = null,
    Object? following = null,
    Object? profilePic = null,
    Object? bannerPic = null,
    Object? uid = null,
    Object? bio = null,
    Object? isTwitterBlue = null,
    Object? lastActive = null,
    Object? isOnline = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      bannerPic: null == bannerPic
          ? _value.bannerPic
          : bannerPic // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      isTwitterBlue: null == isTwitterBlue
          ? _value.isTwitterBlue
          : isTwitterBlue // ignore: cast_nullable_to_non_nullable
              as bool,
      lastActive: null == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String name,
      List<String> followers,
      List<String> following,
      String profilePic,
      String bannerPic,
      String uid,
      String bio,
      bool isTwitterBlue,
      String lastActive,
      bool isOnline,
      String? fcmToken});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? followers = null,
    Object? following = null,
    Object? profilePic = null,
    Object? bannerPic = null,
    Object? uid = null,
    Object? bio = null,
    Object? isTwitterBlue = null,
    Object? lastActive = null,
    Object? isOnline = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_$UserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      followers: null == followers
          ? _value._followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      following: null == following
          ? _value._following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      bannerPic: null == bannerPic
          ? _value.bannerPic
          : bannerPic // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      isTwitterBlue: null == isTwitterBlue
          ? _value.isTwitterBlue
          : isTwitterBlue // ignore: cast_nullable_to_non_nullable
              as bool,
      lastActive: null == lastActive
          ? _value.lastActive
          : lastActive // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.email,
      required this.name,
      required final List<String> followers,
      required final List<String> following,
      required this.profilePic,
      required this.bannerPic,
      required this.uid,
      required this.bio,
      required this.isTwitterBlue,
      required this.lastActive,
      required this.isOnline,
      required this.fcmToken})
      : _followers = followers,
        _following = following;

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String email;
  @override
  final String name;
  final List<String> _followers;
  @override
  List<String> get followers {
    if (_followers is EqualUnmodifiableListView) return _followers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_followers);
  }

  final List<String> _following;
  @override
  List<String> get following {
    if (_following is EqualUnmodifiableListView) return _following;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_following);
  }

  @override
  final String profilePic;
  @override
  final String bannerPic;
  @override
  final String uid;
  @override
  final String bio;
  @override
  final bool isTwitterBlue;
  @override
  final String lastActive;
  @override
  final bool isOnline;
  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'User(email: $email, name: $name, followers: $followers, following: $following, profilePic: $profilePic, bannerPic: $bannerPic, uid: $uid, bio: $bio, isTwitterBlue: $isTwitterBlue, lastActive: $lastActive, isOnline: $isOnline, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._followers, _followers) &&
            const DeepCollectionEquality()
                .equals(other._following, _following) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.bannerPic, bannerPic) ||
                other.bannerPic == bannerPic) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.isTwitterBlue, isTwitterBlue) ||
                other.isTwitterBlue == isTwitterBlue) &&
            (identical(other.lastActive, lastActive) ||
                other.lastActive == lastActive) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      name,
      const DeepCollectionEquality().hash(_followers),
      const DeepCollectionEquality().hash(_following),
      profilePic,
      bannerPic,
      uid,
      bio,
      isTwitterBlue,
      lastActive,
      isOnline,
      fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final String email,
      required final String name,
      required final List<String> followers,
      required final List<String> following,
      required final String profilePic,
      required final String bannerPic,
      required final String uid,
      required final String bio,
      required final bool isTwitterBlue,
      required final String lastActive,
      required final bool isOnline,
      required final String? fcmToken}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  List<String> get followers;
  @override
  List<String> get following;
  @override
  String get profilePic;
  @override
  String get bannerPic;
  @override
  String get uid;
  @override
  String get bio;
  @override
  bool get isTwitterBlue;
  @override
  String get lastActive;
  @override
  bool get isOnline;
  @override
  String? get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
