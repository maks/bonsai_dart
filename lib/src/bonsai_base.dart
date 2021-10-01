import 'dart:developer' as developer;
import 'dart:io';

import 'package:logging/logging.dart';

/// Log is mainly a wrapper for static methods calling dart:developer logging or to stdout/stderr
/// while adding some nice extra's such as datetime stamp and tag string
class Log {
  static final Logger _logger = Logger('bonsai');
  static const initMesg = '==== Bonsai logging started ====';

  /// initialise the logging output
  static void init([bool? useStd]) {
    if (true == useStd) {
      stdout.writeln(initMesg);
    } else {
      developer.log(initMesg);
    }
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      final mesg = '${rec.level.name}: ${rec.time}: ${rec.message}';
      if (true == useStd) {
        if (rec.level >= Level.SEVERE) {
          stderr.writeln('$mesg\n${rec.error}\n${rec.stackTrace}');
        } else {
          stdout.writeln(mesg);
        }
      } else {
        developer.log(mesg, level: rec.level.value, error: rec.error);
      }
    });
  }

  /// debug level message
  static void d(String tag, String mesg) => _logger.fine('[$tag] $mesg');

  /// info level message
  static void i(String tag, String mesg) => _logger.info('[$tag] $mesg');

  /// warning level message
  static void w(String tag, String mesg, {Object? data}) => _logger.warning('[$tag] $mesg');

  /// error level message
  static void e(String mesg, [Object? error, StackTrace? stackTrace]) => _logger.severe(mesg, error, stackTrace);
}

extension BonsaiLogExt on Object {
  /// a nice helper ext method makes this available to every object, chooses a default level of 'debug'
  /// and gets the calling object type without needing to do expensive operation to get stacktrace
  void log(String mesg) => Log.d(runtimeType.toString(), mesg);
}
