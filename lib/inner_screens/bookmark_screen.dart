import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/empty_screen_widget.dart';

import '../widgets/articles_widget.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    Size size = Utils(context).getScreenSize;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'News app',
          style: GoogleFonts.lobster(
            textStyle: TextStyle(
              color: color,
              fontSize: 20,
              letterSpacing: 0.6,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: EmptyScreenWidget(
        text: 'You didn\'t add anything yet to your bookmarks',
        imagePath: 'assets/images/bookmark.png',
      )gg,
      // ListView.builder(
      //   itemCount: 20,
      //   itemBuilder: (ctx, index) {
      //     return const ArticlesWidget();
      //   },
      // ),
    );
  }
}
