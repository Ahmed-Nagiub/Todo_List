import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/my_provider.dart';
import '../../shared/styles/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeBottomSheet extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme();
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context)!.light,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1?.copyWith(
                        color: provider.themeMode == ThemeMode.light
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
                    color: provider.themeMode == ThemeMode.light
                        ? MyThemeData.lightTheme.primaryColor
                        : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeTheme();
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      AppLocalizations.of(context)!.dark,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1?.copyWith(
                        color: provider.themeMode == ThemeMode.dark
                            ? MyThemeData.lightTheme.primaryColor
                            : Colors.black
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.done,
                    size: 30,
                    color: provider.themeMode == ThemeMode.dark
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