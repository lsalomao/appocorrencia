import 'package:appcenter/appcenter.dart';
import 'package:appcenter_analytics/appcenter_analytics.dart';
import 'package:appcenter_crashes/appcenter_crashes.dart';

import 'package:flutter/material.dart';
import 'package:app_ocorrencia/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  await AppCenter.start(
      "1931dfc4-0692-4005-994f-4e2fc79e749d", [AppCenterAnalytics.id, AppCenterCrashes.id]);

  runApp(ModularApp(module: AppModule()));
}
