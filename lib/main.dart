import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test12/WordsModel.dart';

import 'FavModel.dart';
import 'RandomWords.dart';
import 'LikedWords.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => WordsModel()),
      ChangeNotifierProvider(create: (context) => FavModel())
    ],
    child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {



    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black
        )
      ),
      home: const RandomWords(),
      routes: {
        SecondScreen.routeName: (context) {
          return const SecondScreen();
        },
      },
    );
  }
}



