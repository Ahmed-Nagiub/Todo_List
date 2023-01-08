import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../../shared/styles/colors.dart';
import 'Theme_bottom_sheet.dart';
import 'language_bottom_sheet.dart';

class settingsScreen extends StatelessWidget {
  static const String routeName = 'SettingsScreen';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.themeMode == ThemeMode.light
          ? Color.fromRGBO(223, 236, 219, 1.0)
          : onBackgroundDarkColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '${AppLocalizations.of(context)!.language} :',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: colorBlack,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.languageCode=='en'?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.black),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${AppLocalizations.of(context)!.theme} :',
              style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: colorBlack
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showThemeBottomSheet(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.themeMode== ThemeMode.light ? AppLocalizations.of(context)!.light : AppLocalizations.of(context)!.dark,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.black),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ThemeBottomSheet();
        });
  }
}
