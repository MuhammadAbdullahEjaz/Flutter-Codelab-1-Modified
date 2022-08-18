import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test12/FavModel.dart';
import 'package:test12/WordsModel.dart';

import 'LikedWords.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  Future<void> _toLikedWords(BuildContext context) async {
    final result = await Navigator.pushNamed(context, SecondScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Words"),
          actions: [
            IconButton(
                onPressed: () {
                  _toLikedWords(context);
                },
                icon: const Icon(Icons.list))
          ],
        ),
        body: Consumer2<WordsModel, FavModel>(
            builder: (context, wordsModel, favModel, child) => ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, i) {
                    if (i.isOdd) return const Divider();
                    final index = i ~/ 2;
                    if (index >= wordsModel.words.length) {
                      wordsModel.getMoreWords();
                    }
                    final alreadySaved = favModel.isFav(word: wordsModel.words[index]);
                    return ListTile(
                        title: Text(wordsModel.words[index].asPascalCase),
                        trailing: Icon(
                          alreadySaved ? Icons.favorite : Icons.favorite_border,
                          color: alreadySaved ? Colors.red : null,
                          semanticLabel:
                              alreadySaved ? "Remove from saved" : "Save",
                        ),
                        onTap: () {
                          if(alreadySaved) {
                            favModel.unFavIt(word: wordsModel.words[index]);
                          }else{
                            favModel.favIt(word: wordsModel.words[index]);
                          }
                        });
                  },
                )
        )
    );
  }
}
