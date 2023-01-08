import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/tasks.dart';


CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addTaskFireStore(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Stream<QuerySnapshot<Task>> getTasksFromFireStore(DateTime dateTime){

  return getTaskCollection().where('date',isEqualTo:DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).snapshots();

}
void deleteTaskFromFirestore(String id){
  getTaskCollection().doc(id).delete();
}
