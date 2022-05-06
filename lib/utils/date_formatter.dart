import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

Future<String> formatDate(DateTime date) async {
  final systemLocale = await findSystemLocale();
  var formatter = DateFormat.yMMMMd(systemLocale);
  String formatted = formatter.format(date);

  return formatted;
}
