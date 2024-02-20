import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/chat/infrastructure/models/message.dart';
part 'chat_state.freezed.dart';

part 'chat_state.g.dart';

@freezed
class ChatState with _$ChatState {
  const ChatState._();
  const factory ChatState.init() = _ChatInit;
  const factory ChatState.data({
    required List<Message> messageList,
  }) = _ChatData;
  const factory ChatState.error() = _ChatError;
  const factory ChatState.empty() = _ChatEmpty;
  const factory ChatState.loading() = _ChatLoading;

  factory ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);
}
