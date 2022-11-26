import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/providers/theme_provider.dart';
import 'package:news_app_flutter_course/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  const VerticalSpacing(height: 20.0),
                  Flexible(
                    child: Text(
                      'News app',
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(height: 20.0),
            ListTiles(
              label: "Home",
              fct: () {},
              icon: IconlyBold.home,
            ),
            ListTiles(
              label: "Bookmark",
              icon: IconlyBold.bookmark,
              fct: () {},
            ),
            const Divider(
              thickness: 5,
            ),
            SwitchListTile(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles(
      {Key? key, required this.label, required this.fct, required this.icon})
      : super(key: key);

  final String label;
  final Function fct;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        fct();
      },
    );
  }
}
