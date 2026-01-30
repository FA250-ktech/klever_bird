import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kleverbird/locator.dart';
import 'package:kleverbird/services/navigation_service.dart';
import 'package:kleverbird/services/shorebird_service.dart';
import 'package:provider/provider.dart';
import 'package:restart_app/restart_app.dart';
import 'package:terminate_restart/terminate_restart.dart';

class ShorebirdProvider extends ChangeNotifier {
  final _shorebirdService = locator<ShorebirdService>();
  final _navService = locator<NavigationService>();

  String? appPatch = '';
  bool? get shorebirdPatchAvailable =>
      _shorebirdService.shorebirdPatchAvailable;
  Future<void> getAppVer() async {
    appPatch = await _shorebirdService.checkAppPatch();
    notifyListeners();
  }

  bool isPatchDownloading = false;
  bool isPatchDownloadComplete = false;
  double downloadProgress = 0.0;
  Future<void> downloadPatch() async {
    isPatchDownloading = true;
    notifyListeners();
    await _shorebirdService.downloadPatch();
    downloadProgress = 0.5;
    notifyListeners();
    isPatchDownloading = false;
    isPatchDownloadComplete = true;
    downloadProgress = 1.0;
    notifyListeners();
  }

  Future<void> forceUpdate(bool isShorebird, bool isShorebirdComplete) async {
    try {
      if (isShorebird && !isShorebirdComplete) {
        Provider.of<ShorebirdProvider>(
          _navService.getCurrentContext(),
          listen: false,
        ).downloadPatch();
      } else if (isShorebirdComplete) {
        if (Platform.isIOS) {
          Restart.restartApp();
        } else {
          await TerminateRestart.instance.restartApp(
            options: TerminateRestartOptions(),
          );
        }
      }
    } catch (e, stackTrace) {
      print('error: ${e.toString()}\nStackTrace: $stackTrace');
    }
  }
}
