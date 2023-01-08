import 'package:flutter/cupertino.dart';

class BottomNavBar extends ChangeNotifier {

  int currentIndex=0;

  void currentIndexChanged(Index){
    currentIndex=Index;
    notifyListeners();
  }
}