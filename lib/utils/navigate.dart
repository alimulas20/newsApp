import 'package:flutter/cupertino.dart';



void backScreen(context) {
  Navigator.pop(context);
}


void nextScreen(context, page) {
  Navigator.of(context).push(CupertinoPageRoute(
      builder: (context) => page,

  ),
  );
}