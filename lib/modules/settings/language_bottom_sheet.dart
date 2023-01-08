import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/my_provider.dart';
import 'package:todo_list/shared/styles/my_theme.dart';
class LanguageBottomSheet extends StatelessWidget {

  late MyProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage('en');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      AppLocalizations.of(context)!.english,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1?.copyWith(
                      color: provider.languageCode == 'en'
                          ? MyThemeData.lightTheme.primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'en'
                        ? MyThemeData.lightTheme.primaryColor
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage('ar');
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      AppLocalizations.of(context)!.arabic,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1?.copyWith(
                      color: provider.languageCode == 'ar'
                          ? MyThemeData.lightTheme.primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: provider.languageCode == 'ar'
                        ? MyThemeData.lightTheme.primaryColor
                        : Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}