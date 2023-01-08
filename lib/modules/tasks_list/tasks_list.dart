import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/tasks.dart';
import 'package:todo_list/shared/network/local/firebase_utils.dart';
import '../../providers/my_provider.dart';
import '../../shared/styles/colors.dart';
import 'task_item.dart';

class tasksList extends StatefulWidget {

  static const String routeName='tasksList';

  @override
  State<tasksList> createState() => _tasksListState();
}

class _tasksListState extends State<tasksList> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      color: provider.themeMode == ThemeMode.light
          ? Color.fromRGBO(223, 236, 219, 1.0)
          : onBackgroundDarkColor,
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: date,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (datetime){
              print(date);
              date = datetime;
              setState(() {});
            },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.black,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: Colors.blue,
            selectableDayPredicate: (day) => true,
            dotsColor: Colors.white,
            locale: 'en',
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
              stream: getTasksFromFireStore(date),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError){
                    return Text("Something Went Wrong");
                  }
                  var tasks = snapshot.data?.docs.map((e) => e.data()).toList()??[];
                  return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskItem(tasks[index]);
                      },);
                },)
          ),
        ],
      ),
    );
  }
}
