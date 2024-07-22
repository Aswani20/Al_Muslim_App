import 'package:al_muslim/providers/app_config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.dark);
          },
          child: provider.appTheme == ThemeMode.dark
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.dark)
              : getUnselectedItemWidget(
                  context,
                  AppLocalizations.of(context)!.dark,
                ),
        ),
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.light);
          },
          child: provider.appTheme == ThemeMode.light
              ? getSelectedItemWidget(
                  context, AppLocalizations.of(context)!.light)
              : getUnselectedItemWidget(
                  context,
                  AppLocalizations.of(context)!.light,
                ),
        ),
      ],
    );
  }

  Widget getSelectedItemWidget(BuildContext context, String text) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
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
