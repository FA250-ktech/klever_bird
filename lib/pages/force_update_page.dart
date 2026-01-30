import 'package:flutter/material.dart';
import 'package:kleverbird/providers/shorebird_provider.dart';
import 'package:kleverbird/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ForceUpdatePage extends StatefulWidget {
  const ForceUpdatePage({super.key});

  @override
  State<ForceUpdatePage> createState() => _ForceUpdatePageState();
}

class _ForceUpdatePageState extends State<ForceUpdatePage> {
  @override
  void initState() {
    print('ForceUpdatePage initialized');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, ShorebirdProvider>(
      builder: (context, provider, shorebirdProvider, child) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.15,
              left: MediaQuery.sizeOf(context).width * 0.365,
              child: Image.asset(
                'assets/logos/klever_stock_logo_4.png',
                height: MediaQuery.sizeOf(context).width * 0.27,
                width: MediaQuery.sizeOf(context).width * 0.27,
                filterQuality: FilterQuality.medium,
                isAntiAlias: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.6,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'Force Shorebird Update',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        shorebirdProvider.isPatchDownloadComplete
                            ? "The update is complete. Please restart the app."
                            : 'Please update Shorebird to continue using the app.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          height: 1.8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (shorebirdProvider.isPatchDownloadComplete)
                      _buildUpdateButton(context, true, true)
                    else if (shorebirdProvider.shorebirdPatchAvailable == true)
                      shorebirdProvider.isPatchDownloading
                          ? _buildDownloadProgress(context, shorebirdProvider)
                          : _buildUpdateButton(
                              context,
                              true,
                              false,
                            ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateButton(
    BuildContext context,
    bool isShorebird,
    bool isComplete,
  ) {
    return UpdateNowButton(
      isShorebird: isShorebird,
      isShorebirdComplete: isComplete,
    );
  }

  Widget _buildDownloadProgress(
    BuildContext context,
    ShorebirdProvider shorebirdProvider,
  ) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: LinearProgressIndicator(
            value: shorebirdProvider.downloadProgress,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            backgroundColor: Colors.transparent,
            minHeight: 10,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Downloading...',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class UpdateNowButton extends StatelessWidget {
  bool isShorebird = false;
  bool isShorebirdComplete;
  UpdateNowButton({
    required this.isShorebird,
    this.isShorebirdComplete = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async => Provider.of<ShorebirdProvider>(
        context,
        listen: false,
      ).forceUpdate(isShorebird, isShorebirdComplete),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          (isShorebirdComplete) ? 'Restart App' : 'Update Now',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
