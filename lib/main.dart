import 'dart:io';

import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/models/article_hive.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleHiveAdapter());
  await Hive.openBox<ArticleHive>('ArticleHive');
  runApp(const MyApp());
}
