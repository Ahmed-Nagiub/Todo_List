import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/settings/settings.dart';
import '../modules/tasks_list/tasks_list.dart';
import '../providers/bottom_navBar_provider.dart';
import '../providers/my_provider.dart';
import 'add_task_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  static const String routeName='home';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<BottomNavBar>(context);
    //var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.routeTasks,)),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 9,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          currentIndex: pro.currentIndex,
          onTap: (index){
            pro.currentIndexChanged(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list,size: 30),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30),label: ''),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        shape: StadiumBorder(
            side: BorderSide(
                color: Colors.white,
                width: 4
            )
        ),
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[pro.currentIndex],
    );
  }
  List<Widget> tabs=[tasksList(),settingsScreen(),];

  void showAddTaskBottomSheet(){

    showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) {
      return Container(
          height: MediaQuery.of(context).size.height*0.70 ,
          child: AddTaskBottomSheet()
      );
    },);
  }
}
