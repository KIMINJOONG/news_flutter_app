import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/models/bookmarks_model.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/drawer_widget.dart';
import 'package:news_app_flutter_course/widgets/empty_screen_widget.dart';
import 'package:provider/provider.dart';

import '../consts/vars.dart';
import '../providers/bookmarks_provider.dart';
import '../widgets/articles_widget.dart';
import '../widgets/loading_widget.dart';

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
      drawer: DrawerWidget(),
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
      body: FutureBuilder<List<BookmarksModel>>(
        future: Provider.of<BookmarksProvider>(context, listen: false)
            .fetchBookmarks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget(
              newsType: NewsType.allNews,
            );
          } else if (snapshot.hasError) {
            return EmptyScreenWidget(
              text: 'You didn\'t add anything yet to your bookmarks',
              imagePath: 'assets/images/bookmark.png',
            );
          } else if (snapshot.data == null) {
            return Expanded(
              child: EmptyScreenWidget(
                text: "No news found",
                imagePath: "assets/images/no_news.png",
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: const ArticlesWidget(
                    isBookmark: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
