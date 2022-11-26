import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: Scaffold(
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(IconlyLight.search),
            )
          ],
        ),
        drawer: DrawerWidget(),
        body: Center(
          child: Container(),
        ),
      ),
    );
  }
}
