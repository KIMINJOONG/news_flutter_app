import 'package:flutter_dotenv/flutter_dotenv.dart';

String BASEURL = "newsapi.org";
String? BASEURL_FIREBASE = dotenv.env['BASE_URL_FIREBASE'];
String? API_KEY = dotenv.env['API_KEY'];