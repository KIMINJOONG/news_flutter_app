import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app_flutter_course/services/global_methods.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/vertical_spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailWebView extends StatefulWidget {
  const NewsDetailWebView({Key? key}) : super(key: key);

  @override
  State<NewsDetailWebView> createState() => _NewsDetailWebViewState();
}

class _NewsDetailWebViewState extends State<NewsDetailWebView> {
  late WebViewController _webViewController;
  double _progress = 0.0;
  final url = 'https://www.naver.com';

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(IconlyLight.arrowLeft2),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'URL',
            style: TextStyle(
              color: color,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await _showModalSheetFct();
              },
              icon: Icon(Icons.more_horiz),
            ),
          ],
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.blue,
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            Expanded(
              child: WebView(
                initialUrl: url,
                zoomEnabled: true,
                onProgress: (progress) {
                  setState(() {
                    _progress = _progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showModalSheetFct() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacing(height: 20),
              Center(
                child: Container(
                  height: 5,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const VerticalSpacing(height: 20),
              Text(
                'More Option',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const VerticalSpacing(height: 20),
              ListTile(
                leading: Icon(Icons.share),
                title: const Text(
                  'Share',
                ),
                onTap: () async {
                  try {
                    await Share.share('url', subject: 'Look What I made!');
                  } catch (err) {
                    log(err.toString());
                    GlobalMethods().errorDialog(
                        errorMessage: err.toString(), context: context);
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.open_in_browser),
                title: const Text(
                  'Open in browser',
                ),
                onTap: () async {
                  try {
                    if (!await launchUrl(Uri.parse(url)))
                      throw 'Could not launch $url';
                  } catch (err) {
                    log(err.toString());
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.refresh),
                title: const Text(
                  'Refresh',
                ),
                onTap: () async {
                  try {
                    await _webViewController.reload();
                  } catch (err) {
                    log("error occured $err");
                  } finally {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
