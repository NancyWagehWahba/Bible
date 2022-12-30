import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Pray extends StatefulWidget {
  @override
  State<Pray> createState() => _PrayState();
}

class _PrayState extends State<Pray> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.of(context)!.prayLord1),
          Text(AppLocalizations.of(context)!.prayLord2),
          Text(AppLocalizations.of(context)!.prayLord3),
          Text(AppLocalizations.of(context)!.prayLord4),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 50),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(12))
            ),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                child: Text(
                  '+',
                  style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 30),
                ),
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  count = 0;
                });
              },
              child: const Text('Reset')),
        ],
      ),
    );
  }
}
