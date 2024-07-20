import 'package:al_muslim/home/hadeth/hadeth_tab.dart';
import 'package:al_muslim/home/hadeth/item_hadeth_details.dart';
import 'package:al_muslim/my_theme.dart';
import 'package:flutter/material.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = "HadethDetailsScreen";

  HadethDetailsScreen({super.key});

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Stack(
      children: [
        Image.asset(
          "assets/images/background_image.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.06,
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            decoration: BoxDecoration(
                color: MyTheme.whiteColor,
                borderRadius: BorderRadius.circular(25)),
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  ItemHadethDetails(content: args.content[index]),
              itemCount: args.content.length,
            ),
          ),
        ),
      ],
    );
  }
}