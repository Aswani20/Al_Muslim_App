import 'package:al_muslim/home/hadeth/item_hadeth_name.dart';
import 'package:al_muslim/my_theme.dart';
import 'package:al_muslim/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadeth();
    }
    return Column(
      children: [
        Center(
          child: Image.asset("assets/images/hadeth.png"),
        ),
        Divider(
          color: provider.appTheme == ThemeMode.light
              ? Theme.of(context).primaryColor
              : MyTheme.goldColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.appTheme == ThemeMode.light
              ? Theme.of(context).primaryColor
              : MyTheme.goldColor,
          thickness: 3,
        ),
        ahadethList.isEmpty
            ? CircularProgressIndicator(color: Theme.of(context).primaryColor)
            : Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        ItemHadethName(hadeth: ahadethList[index]),
                    separatorBuilder: (context, index) => Divider(
                          color: provider.appTheme == ThemeMode.light
                              ? Theme.of(context).primaryColor
                              : MyTheme.goldColor,
                          thickness: 3,
                        ),
                    itemCount: ahadethList.length),
              )
      ],
    );
  }

  void loadHadeth() async {
    String hadethContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = hadethContent.split("#\r\n");
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(content: hadethLines, title: title);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.content, required this.title});
}
