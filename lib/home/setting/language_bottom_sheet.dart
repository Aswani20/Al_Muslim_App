import 'package:al_muslim/my_theme.dart';
import 'package:al_muslim/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            provider.changeLanguage("en");
          },
          child: provider.appLanguage == 'en'
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.english)
              : getUnselectedItemWidget(
                  context, AppLocalizations.of(context)!.english),
        ),
        InkWell(
          onTap: () {
            provider.changeLanguage("ar");
          },
          child: provider.appLanguage == 'ar'
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.arabic)
              : getUnselectedItemWidget(
                  context, AppLocalizations.of(context)!.arabic),
        ),
      ],
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String language) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            language,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: provider.appTheme == ThemeMode.light
                    ? MyTheme.primaryColor
                    : MyTheme.goldColor),
          ),
          Icon(
            Icons.check,
            color: provider.appTheme == ThemeMode.light
                ? MyTheme.primaryColor
                : MyTheme.goldColor,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget getUnselectedItemWidget(BuildContext context, String language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        language,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: MyTheme.blackColor),
      ),
    );
  }
}
