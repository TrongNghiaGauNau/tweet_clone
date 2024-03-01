import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

mixin DismissKeyboard {
  dismiss() => FocusManager.instance.primaryFocus?.unfocus();
}

mixin TimeFormat {
  timeAgo(String time) =>
      timeago.format(DateTime.parse(time), locale: 'en_short');
}
