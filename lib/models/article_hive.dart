import 'article_model.dart';
import 'package:hive/hive.dart';
part 'article_hive.g.dart';

@HiveType(typeId: 1)
class ArticleHive extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String author;
  @HiveField(3)
  late String title;
  @HiveField(4)
  late String description;
  @HiveField(5)
  late String url;
  @HiveField(6)
  late String urlToImage;
  @HiveField(7)
  late String publishedAt;
  @HiveField(8)
  late String content;
}
