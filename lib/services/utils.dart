import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  Size get getScreenSize => MediaQuery.of(context).size;

  bool get getTheme => Provider.of<ThemeProvider>(context).getDarkTheme;

  Color get getColor => getTheme ? Colors.white : Colors.black;
}