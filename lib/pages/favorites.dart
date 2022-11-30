import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/color_extension.dart';
import 'package:news_app/core/context_extension.dart';
import 'package:news_app/models/article_hive.dart';
import 'package:news_app/widgets/search_card.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/boxes.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<ArticleHive>>(
        valueListenable: Boxes.getArticleHive().listenable(),
        builder: (context, box, _) {
          final articleHive = box.values.toList().cast<ArticleHive>();

          return box.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: context.width * 0.4,
                        child: Image.asset(
                          "assets/not_found.png",
                          fit: BoxFit.fitWidth,
                        )),
                    context.emptyMediumWidget,
                    context.emptyHighWidget
                  ],
                )
              : ListView.builder(
                  controller: _controller,
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    var currentArticle = box;
                    return Container(
                      child: Text(box.values.first.author),
                    );
                  },
                );
        },
      ),
    );
  }
}
