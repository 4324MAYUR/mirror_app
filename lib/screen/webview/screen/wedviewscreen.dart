import 'package:flutter/material.dart';
import 'package:mirror_wall/screen/home/provider/homeprovider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  InAppWebViewController? webViewController;
  // late WebViewController webViewController;
  late HomeProvider hRead;
  late HomeProvider hWatch;

  // @override
  // void initState() {
  //   super.initState();
  //   webViewController = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted);
  //   urlList();
  // }
  //
  // void urlList() {
  //   final url = hRead.appsData[hRead.index]['url'] ?? 'https://www.google.com';
  //   webViewController.loadRequest(Uri.parse(url));
  // }

  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          hRead.appsData[hRead.index]['name']!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios_new,
        //     color: Colors.white,
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              webViewController?.goBack();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          IconButton(
            onPressed: () {
              webViewController?.reload();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () {
              webViewController?.goForward();
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: hWatch.progressValue,
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri('${hRead.appsData[hRead.index]['url']}'),
              ),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                hRead.changeProgressValue(progress / 100);
              },
            ),
          ),
        ],
      ),
    );
  }
}
