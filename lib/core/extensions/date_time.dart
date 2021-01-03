import 'package:intl/intl.dart';
import 'package:nepal_homes/core/utils/date_time_utils.dart';

extension DateTimeParsingX on String {
  DateTime get toDate => DateTime.parse(this);
}

extension DateTimeX on DateTime {
  String get momentAgo => relativeTimeString(this);

  String get formattedDate => DateFormat('MMM dd, yyyy').format(this);
}
