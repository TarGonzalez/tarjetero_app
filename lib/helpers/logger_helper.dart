import 'package:logger/logger.dart';

class LoggerHelper {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      printTime: true,
    ),
  );

  //info log
  static void info(dynamic message) => _logger.i(message);
  //debug log
  static void debug(dynamic message) => _logger.d(message);
  //error log
  static void error(dynamic message) => _logger.e(message);
  //warning log
  static void warning(dynamic message) => _logger.w(message);
  //wtf log
  static void wtf(dynamic message) => _logger.i(message);
}
