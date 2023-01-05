import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/inner_screens/blog_details.dart';
import 'package:news_app_flutter_course/inner_screens/news_details_webview.dart';
import 'package:news_app_flutter_course/models/news_model.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class TopTrending extends StatelessWidget {
  const TopTrending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    final newsModelProvider = Provider.of<NewsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(
        10.0,
      ),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NewsDetailsScreen.routeName, arguments: newsModelProvider.publishedAt);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl:
                      newsModelProvider.urlToImage,
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(
                  8.0,
                ),
                child: Text(
                  newsModelProvider.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: NewsDetailWebView(
                            url: newsModelProvider.url,
                          ),
                          type: PageTransitionType.rightToLeft,
                          inheritTheme: true,
                          ctx: context,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.link,
                    ),
                  ),
                  const Spacer(),
                  SelectableText(
                    newsModelProvider.dateToShow,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
