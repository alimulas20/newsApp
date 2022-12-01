import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/color_extension.dart';
import 'package:news_app/core/context_extension.dart';
import 'package:news_app/models/article_hive.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/news_detail_page.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/boxes.dart';
import 'package:news_app/utils/navigate.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    //Hive.openBox<ArticleHive>('ArticleHive');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<ArticleHive>>(
        valueListenable: Boxes.getArticleHive().listenable(),
        builder: (context, box, _) {
          return box.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                          height: context.width * 0.4,
                          child: Image.asset(
                            "assets/not_found.png",
                            fit: BoxFit.fitWidth,
                          )),
                    ),
                    context.emptyMediumWidget,
                    context.emptyHighWidget
                  ],
                )
              : ListView.builder(
                  controller: _controller,
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return (GestureDetector(
                      onTap: () {
                        final souce = ArticleModelArticlesSource()
                          ..id = box.getAt(index)!.id
                          ..name = box.getAt(index)!.name;
                        final articles = ArticleModelArticles()
                          ..author = box.getAt(index)!.author
                          ..content = box.getAt(index)!.content
                          ..description = box.getAt(index)!.description
                          ..publishedAt = box.getAt(index)!.publishedAt
                          ..title = box.getAt(index)!.title
                          ..url = box.getAt(index)!.url
                          ..urlToImage = box.getAt(index)!.urlToImage
                          ..source = souce;

                        nextScreen(
                            context, NewsDetailPage(articleModel: articles));
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(context.lowMediumValue),
                        ),
                        elevation: 5,
                        color: context.colors.backgroundSearchTile,
                        child: ListTile(
                            contentPadding: context.paddingLowMedium,
                            leading: CircleAvatar(
                              radius: context.mediumValue,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.newspaper,
                                color: context.colors.orangeColor,
                              ),
                            ),
                            title: Text(
                              box.getAt(index)!.title,
                              style: const TextStyle(
                                fontFamily: 'Rubik',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Image.network(
                                box.getAt(index)!.urlToImage.toString())),
                      ),
                    ));
                  },
                );
        },
      ),
    );
  }
}
