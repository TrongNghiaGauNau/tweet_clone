import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment.freezed.dart';

part 'attachment.g.dart';

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    required String id,
    required String url,
    required String uid,
    required String sentAt,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}
