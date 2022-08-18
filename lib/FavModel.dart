import 'dart:collection';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavModel extends ChangeNotifier{
  final Set<WordPair> _fav = {};

  //Unmodifiable view of data
  UnmodifiableSetView<WordPair> get fav => UnmodifiableSetView(_fav);

  //Functions
  void favIt({required WordPair word}){
    _fav.add(word);
    notifyListeners();
  }
  void unFavIt({required WordPair word}){
    _fav.remove(word);
    notifyListeners();
  }
  bool isFav({required WordPair word}){
    return _fav.contains(word);
  }

}