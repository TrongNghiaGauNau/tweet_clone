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
    required MessageType messageType,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

enum MessageType {
  text('text'),
  media('media'),
  mix('mix');

  final String type;
  const MessageType(this.type);
}
