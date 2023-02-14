import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:overnites/app/factories/auth_service_factory.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Hive.initFlutter();

  //final isAuthenticated = await (await AuthServiceFactory.make()).isAuthenticated();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
