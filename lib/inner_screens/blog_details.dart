import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/consts/vars.dart';
import 'package:news_app_flutter_course/services/global_methods.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/vertical_spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatefulWidget {
  static const routeName = '/NewsDetailsScreen';

  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
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
            iconTheme: IconThemeData(color: color),
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: true,
            title: Text(
              'By Author',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                IconlyLight.arrowLeft,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title' * 10,
                      textAlign: TextAlign.justify,
                      style: smallTextStyle,
                    ),
                    const VerticalSpacing(height: 25),
                    Row(
                      children: [
                        Text(
                          "20/20/2015",
                          style: smallTextStyle,
                        ),
                        const Spacer(),
                        Text(
                          "readingTimeText",
                          style: smallTextStyle,
                        ),
                      ],
                    ),
                    const VerticalSpacing(height: 20),
                  ],
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: FancyShimmerImage(
                        boxFit: BoxFit.fill,
                        errorWidget:
                            Image.asset('assets/images/empty_image.png'),
                        imageUrl:
                            'https://imgnews.pstatic.net/image/009/2022/12/06/0005055868_001_20221206095501034.jpg?type=w647',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  IconlyLight.send,
                                  size: 28,
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              elevation: 10,
                              shape: const CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  IconlyLight.bookmark,
                                  size: 28,
                                  color: color,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const VerticalSpacing(height: 20),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextContent(
                      label: 'Description',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const VerticalSpacing(height: 10),
                    const TextContent(
                      label: 'Description',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                    const VerticalSpacing(height: 20),
                    const TextContent(
                      label: 'Contents',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class TextContent extends StatelessWidget {
  const TextContent({
    Key? key,
    required this.label,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      label,
      textAlign: TextAlign.justify,
      style: GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
