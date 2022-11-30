
import 'package:flutter/material.dart';
import 'package:news_app/core/color_extension.dart';
import 'package:news_app/core/context_extension.dart';
import 'package:news_app/pages/news_detail_page.dart';
import 'package:news_app/utils/navigate.dart';

import '../models/article_model.dart';


class SearchListTitle extends StatelessWidget {
  const SearchListTitle({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final ArticleModelArticles articleModel;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        nextScreen(context, NewsDetailPage(articleModel: articleModel));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.lowMediumValue),
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
            articleModel.title!,
            style: const TextStyle(
              fontFamily: 'Rubik',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),

          trailing: Image.network(articleModel.urlToImage.toString())
        ),
      ),
    );
  }
}
