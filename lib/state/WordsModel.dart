import 'dart:collection';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class WordsModel extends ChangeNotifier{
  final List<WordPair> _words = [];

  //Unmodifiable view of data
  UnmodifiableListView<WordPair> get words => UnmodifiableListView(_words);

  //Functions
  void getMoreWords(){
    _words.addAll(generateWordPairs().take(10));
    notifyListeners();
  }
  void removeWord({required WordPair word}){
    _words.remove(word);
    notifyListeners();
  }

}