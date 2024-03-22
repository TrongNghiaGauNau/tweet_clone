import 'package:intl/intl.dart';

extension ConvertToString on String {
  String dateToString() {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
  }
}
