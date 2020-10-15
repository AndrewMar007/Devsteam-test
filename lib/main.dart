import 'package:flutter/material.dart';
import 'package:project_devsteammobi/pages/imageListView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ImageList Devsteam.mobi',
      theme: ThemeData(),
      home: ImageListView(),
    );
  }
}
