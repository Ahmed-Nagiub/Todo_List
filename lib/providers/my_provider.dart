import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/shared/network/local/firebase_utils.dart';

import '../models/tasks.dart';

class MyProvider extends ChangeNotifier {

  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(){
    if(themeMode == ThemeMode.light){
      themeMode =ThemeMode.dark;
    }else{
      themeMode =ThemeMode.light;
    }
    notifyListeners();
  }
  String languageCode='en';
  void changeLanguage(String lang){
    languageCode = lang;
    notifyListeners();
  }

  void updateTaskToFirestore(Task task){
    FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
      'id':task.id,
      'title':task.title,
      'description':task.description,
      'date':task.date,
      'isDone':task.isDone,
    }
    ).timeout(Duration(milliseconds: 500),onTimeout: (){getTaskCollection();});
  }
  void updateDone(Task task){
    FirebaseFirestore.instance.collection('tasks').doc(task.id).update({
      'isDone':true,
    }
    ).timeout(Duration(milliseconds: 500),onTimeout: (){
      getTaskCollection();
      notifyListeners();
    });
  }
}