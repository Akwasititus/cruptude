import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constants/utils.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          //stay in app
          return false;
        } else {
          //leave app
          return true;
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Center(
                child: LinearProgressIndicator(
                  value: progress,
                ),
              ),
              Expanded(
                child: WebView(
                  initialUrl: 'https://sites.google.com/view/cryptude/home',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onProgress: (progress) {
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              controller.reload();
            },
            child: const Icon(Icons.refresh, color: Colors.white),
            backgroundColor: AppColors.primaryColorBlue,
          ),
        ),
      ),
    );
  }
}
