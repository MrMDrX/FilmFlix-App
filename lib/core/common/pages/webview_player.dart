import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:filmflix/core/constants/api_constants.dart';

class WebviewPlayer extends StatefulWidget {
  final String tmdbId;
  final String? season;
  final String? episode;

  const WebviewPlayer({
    super.key,
    required this.tmdbId,
    this.season,
    this.episode,
  });

  @override
  State<WebviewPlayer> createState() => _WebviewPlayerState();
}

class _WebviewPlayerState extends State<WebviewPlayer>
    with WidgetsBindingObserver {
  late String viewUrl;
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Init WebView controller
    _initializeViewUrl();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final host = Uri.parse(request.url).host;
            if (host != Uri.parse(viewUrl).host) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(viewUrl));

    // Set immersive mode for landscape viewing
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    WidgetsBinding.instance.addObserver(this);
  }

  void _initializeViewUrl() {
    if (widget.season != null && widget.episode != null) {
      // TV show with specific season and episode
      viewUrl =
          '${ApiConstants.playerUrl}/tv/${widget.tmdbId}/${widget.season!}/${widget.episode!}';
    } else {
      // Movie
      viewUrl = '${ApiConstants.playerUrl}/movie/${widget.tmdbId}';
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
