import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';

class ExLog {
  ExLog._();

  static Future<void> init() async {
    Loggy.initLoggy(
      logPrinter: StreamPrinter(const PrettyDeveloperPrinter()),
      logOptions: const LogOptions(
        LogLevel.all,
        stackTraceLevel: LogLevel.error,
      ),

    );

    logInfo('GreduLog is ready...');
  }
}

void log(message) {
  if (kDebugMode) {
    logDebug(message);
  }
}

void print(message) {
  logDebug(message);
}

void logD(message) {
  if (kDebugMode) {
    logDebug('$message');
  }
}

void logE(message) {
  if (kDebugMode) {
    logError('$message');
  }
}

void logI(message) {
  if (kDebugMode) {
    logInfo(message);
  }
}

void logW(message) {
  if (kDebugMode) {
    logWarning('$message');
  }
}
