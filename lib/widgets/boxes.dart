import 'package:hive/hive.dart';
import '../models/article_hive.dart';

class Boxes {
  static Box<ArticleHive> getArticleHive() =>
      Hive.box<ArticleHive>('ArticleHive');
}
