import 'package:kleverbird/helpers/constants/route_names.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';

class ShorebirdService {
  final updater = ShorebirdUpdater();

  String? appPatchRoute;
  bool? shorebirdPatchAvailable;
  String? appShorebirdVersion;
  UpdateStatus? shorebirdUpdateStatus;
  bool isRestartRequired = false;

  Future<String?> checkAppPatch() async {
    final currentPatch = await updater.readCurrentPatch();
    appShorebirdVersion = currentPatch?.number.toString();

    if (updater.isAvailable) {
      final status = await updater.checkForUpdate();
      shorebirdUpdateStatus = status;
      if (status == UpdateStatus.outdated) {
        print('Shorebird patch is outdated');
        shorebirdPatchAvailable = true;
        isRestartRequired = false;
        return forceUpdatePageRoute.routeName;
      } else if (status == UpdateStatus.restartRequired) {
        print('Shorebird patched, restart required');
        shorebirdPatchAvailable = true;
        isRestartRequired = true;
        return forceUpdatePageRoute.routeName;
      } else if (status == UpdateStatus.upToDate) {
        print('Shorebird patch is up to date');
        shorebirdPatchAvailable = false;
        isRestartRequired = false;
      } else {
        print('Shorebird patch check failed with status: $status');
      }
    } else {
      print('Shorebird updater is not available or latest version.');
    }
    return null;
  }

  Future<void> downloadPatch() async {
    await updater.update();
    await Future.delayed(const Duration(seconds: 1));
    isRestartRequired = true;
  }
}
