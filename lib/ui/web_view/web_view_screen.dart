import 'package:flutter/material.dart';
import 'package:hfk_flutter_clone/core/app_urls.dart';
import 'package:hfk_flutter_clone/styles/app_colors.dart';
import 'package:hfk_flutter_clone/styles/theme_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String intentKeyAppBarTitle;
  final String intentKeyWebUrl;

  const WebViewScreen({
    super.key,
    required this.intentKeyAppBarTitle,
    required this.intentKeyWebUrl,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController mWebViewController;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    initWebViewController();
  }

  void initWebViewController() {
    mWebViewController = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(widget.intentKeyWebUrl),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildWebViewWidget(),
          _buildLoadingIndicator(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.intentKeyAppBarTitle,
        style: ThemeText.font15Medium.apply(
          color: AppColors.white,
        ),
      ),
      backgroundColor: AppColors.americanGreen,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
    );
  }

  Widget _buildWebViewWidget() {
    return WebViewWidget(
      controller: mWebViewController,
    );
  }

  Widget _buildLoadingIndicator() {
    return (loadingPercentage < 100)
        ? LinearProgressIndicator(
            color: AppColors.kellyGreen,
            value: loadingPercentage / 100.0,
          )
        : Container();
  }
}
