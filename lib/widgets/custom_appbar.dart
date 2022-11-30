import 'package:flutter/material.dart';
import 'package:news_app/core/color_extension.dart';
import 'package:news_app/core/context_extension.dart';
import 'package:news_app/utils/navigate.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    Key? key,
    this.centerTitle = false,
    this.onTap,
    this.color,
    this.backgroundColor,
    this.backButton = true,
    this.subText,
    this.actions,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;

  bool centerTitle;
  bool backButton;
  Color? backgroundColor;
  VoidCallback? onTap;
  Color? color;
  String? subText;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(

        // elevation: 1,
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        toolbarHeight: kToolbarHeight,
        centerTitle: centerTitle,
        title: RichText(
          text: TextSpan(
            text: 'News', //first part
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: context.colors.grayFiveColor),
            children: <TextSpan>[
              TextSpan(
                  text: ' APP', //second part
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: context.colors.orangeColor)),
            ],
          ),
        ),
        actions: actions);
  }
}
