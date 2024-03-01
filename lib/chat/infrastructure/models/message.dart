import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String receiverId,
    required String senderId,
    required String message,
    required String sentAt,
    @Default([]) List<String> imagesIdList,
    @Default(false) bool seen,
    Map<String, dynamic>? replyMessage,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
