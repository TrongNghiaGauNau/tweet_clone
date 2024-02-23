import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';

part 'message_state.freezed.dart';

part 'message_state.g.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    required Message message,
    @Default(false) bool showSeen,
  }) = _MessageState;

  factory MessageState.fromJson(Map<String, dynamic> json) =>
      _$MessageStateFromJson(json);
}
