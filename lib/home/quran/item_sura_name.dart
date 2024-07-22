import 'package:al_muslim/home/quran/sura_details_screen.dart';
import 'package:al_muslim/my_theme.dart';
import 'package:al_muslim/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          SuraDetailsScreen.routeName,
          arguments: SuraDetailsArgs(name: name, index: index),
        );
      },
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.blackColor
                : MyTheme.whiteColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
