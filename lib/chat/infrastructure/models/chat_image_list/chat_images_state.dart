import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_images_state.freezed.dart';
part 'chat_images_state.g.dart';

@freezed
class ChatImagesState with _$ChatImagesState {
  const ChatImagesState._();
  const factory ChatImagesState.init() = _ChatImagesInit;
  const factory ChatImagesState.data({
    required List<String> imagesList,
  }) = _ChatImagesData;
  const factory ChatImagesState.error() = _ChatImagesError;
  const factory ChatImagesState.empty() = _ChatImagesEmpty;
  const factory ChatImagesState.loading() = _ChatImagesLoading;

  factory ChatImagesState.fromJson(Map<String, dynamic> json) =>
      _$ChatImagesStateFromJson(json);
}
