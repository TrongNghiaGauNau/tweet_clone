import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/user_profile/infrastructure/models/user.dart';

part 'chat_list_state.freezed.dart';

part 'chat_list_state.g.dart';

@freezed
class ChatListState with _$ChatListState {
  const ChatListState._();
  const factory ChatListState.init() = _ChatListInit;
  const factory ChatListState.data({
    required List<User> chatList,
  }) = _ChatListData;
  const factory ChatListState.error() = _ChatListError;
  const factory ChatListState.empty() = _ChatListEmpty;
  const factory ChatListState.loading() = _ChatListLoading;

  factory ChatListState.fromJson(Map<String, dynamic> json) =>
      _$ChatListStateFromJson(json);
}
