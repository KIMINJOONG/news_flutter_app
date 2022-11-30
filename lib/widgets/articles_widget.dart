import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/services/utils.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 60,
                  height: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        height: size.height * 0.12,
                        width: size.height * 0.12,
                        boxFit: BoxFit.fill,
                        imageUrl:
                            'http://dimg.donga.com/ugc/CDB/WEEKLY/Article/5b/02/77/fa/5b0277fa109dd2738de6.jpg',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
