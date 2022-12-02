import 'package:dio/dio.dart';
import 'package:news_app/constants/constants.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/utils/locale_keys.dart';
import 'package:news_app/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

var dio = Dio();

class AppService {
  Future openLink(context, String url) async {
    if (await url_launcher.canLaunch(url)) {
      url_launcher.launch(url);
    } else {
      openToastLong(context, LocaleKeys.launch_url);
    }
  }

  static Future searchArticles(String value, int pageNumber) async {
    List<ArticleModelArticles> list = [];

    String searchText = value;

    var result = await Dio().get(
        "${Constants.baseUrl}$searchText&page=$pageNumber&apiKey=${Constants.apiKey}");
    // print(result);

    var articleList = result.data["articles"];

    if (articleList is List) {
      list = articleList.map((e) => ArticleModelArticles.fromJson(e)).toList();
    }
    return list;
  }
}
