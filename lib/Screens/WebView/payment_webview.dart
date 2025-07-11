import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomBar/customapp_top_bar.dart';
import 'package:hotelbookingapp/Themes/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String url;

  const PaymentWebView({super.key, required this.url});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;
  bool _isLoading = true; // Tambahkan flag loading

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppTopBar(
        title: 'pembayaran',
        onPop: () {
          Navigator.pop(context);
        },
        onTap: () {},
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: AppColors.buttonColor,
                size: 50,
              ),
            ),
        ],
      ),
    );
  }
}
