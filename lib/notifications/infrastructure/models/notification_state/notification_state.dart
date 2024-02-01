import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twitter_clone_2/notifications/infrastructure/models/notification_model.dart';

part 'notification_state.freezed.dart';

part 'notification_state.g.dart';

@freezed
class NotificationState with _$NotificationState {
  const NotificationState._();
  const factory NotificationState.init() = _NotificationInit;
  const factory NotificationState.data({
    required List<NotificationModel> notificationList,
  }) = _NotificationData;
  const factory NotificationState.error() = _NotificationError;
  const factory NotificationState.empty() = _NotificationEmpty;
  const factory NotificationState.loading() = _NotificationLoading;

  factory NotificationState.fromJson(Map<String, dynamic> json) =>
      _$NotificationStateFromJson(json);
}
