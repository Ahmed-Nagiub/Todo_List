import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'layout/home_screen.dart';
import 'modules/settings/settings.dart';
import 'modules/tasks_list/tasks_list.dart';
import 'providers/bottom_navBar_provider.dart';
import 'providers/my_provider.dart';
import 'shared/styles/my_theme.dart';
import 'modules/update_isDone/update_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   //await FirebaseFirestore.instance.disableNetwork();
  //FirebaseFirestore.instance.settings=Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomNavBar(),),
      ChangeNotifierProvider(create: (context) => MyProvider(),),
    ],
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English, no country code
        Locale('ar'), // Spanish, no country code
      ],
      locale: Locale(provider.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: homeScreen.routeName,
      routes: {
        homeScreen.routeName:(context)=>homeScreen(),
        settingsScreen.routeName:(context)=>settingsScreen(),
        tasksList.routeName:(context)=>tasksList(),
        updateScreen.routeName:(context) => updateScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
    );
  }
}
