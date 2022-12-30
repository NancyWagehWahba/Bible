import 'package:flutter/material.dart';
import '../../theme/my_theme_data.dart';


class BibleItem extends StatelessWidget {
  String verse = 'Genesis';
  Function getVerses;

  BibleItem(this.verse, this.getVerses);


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: getVerses(),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  verse,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                const Divider(
                  color: MyTheme.armadilloColor,
                  height: 2,
                )
              ],
            ),
          )),
    );
  }
}