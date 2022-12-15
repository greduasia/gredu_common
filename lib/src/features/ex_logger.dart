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
  logDebug(message);
}

void print(message) {
  logDebug(message);
}

void logD(message) {
  logDebug('$message');
}

void logE(message) {
  logError('$message');
}

void logI(message) {
  logInfo(message);
}

void logW(message) {
  logWarning('$message');
}
