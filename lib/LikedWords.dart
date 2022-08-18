import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test12/FavModel.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  static const routeName = "/likedWordsScreen";

  @override
  Widget build(BuildContext context) {
    return const LikedWords();
  }
}

class LikedWords extends StatefulWidget {
  const LikedWords({Key? key}) : super(key: key);

  @override
  State<LikedWords> createState() => _LikedWordsState();
}

class _LikedWordsState extends State<LikedWords> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Liked Suggestions"),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: Consumer<FavModel>(
            builder: (context, favModel, child) => ListView.builder(
              itemCount: favModel.fav.length,
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text(favModel.fav.toList()[i].asPascalCase),
                  trailing: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                    semanticLabel: "UnFav it",
                  ),
                  onTap: (){
                    favModel.unFavIt(word: favModel.fav.toList()[i]);
                  },
                );
              },
            ),
          ),
        ));
  }
}
