import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/models/tasks.dart';
import 'package:todo_list/modules/update_isDone/update_field.dart';
import 'package:todo_list/providers/my_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class updateScreen extends StatefulWidget {

  static const String routeName = "updateScreen";

  @override
  State<updateScreen> createState() => _updateScreenState();
}

class _updateScreenState extends State<updateScreen> {
  late TextEditingController titleController;
  late MyProvider provider;
  late TextEditingController desController;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Task todo = ModalRoute.of(context)!.settings.arguments as Task;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    titleController = TextEditingController(text: todo.title);
    desController = TextEditingController(text: todo.description);
    provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(AppLocalizations.of(context)!.toDoList),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context)!.editTask,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                  SizedBox(height: height*0.01,),
                  updateField(titleController, AppLocalizations.of(context)!.title, TextInputType.text,(value){todo.title=value;},
                          (value){if(value!.isEmpty){return AppLocalizations.of(context)!.pleaseEnterTaskTitle;}return null;}),
                  SizedBox(height: height*0.03,),
                  updateField(desController, AppLocalizations.of(context)!.description, TextInputType.multiline,(value){todo.description=value;},
                          (value){if(value!.isEmpty){return AppLocalizations.of(context)!.pleaseEnterTaskDescription;}return null;}),
                  SizedBox(height: height*0.06,),
                  Text(AppLocalizations.of(context)!.selectDate,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),
                  SizedBox(height: height*0.06,),
                  InkWell(
                    onTap: (){
                      selectDate();
                    },
                    child: Text(
                      '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontSize: 15,
                        color: Colors.grey
                      ),),
                  ),
                  SizedBox(height: height*0.06,),
                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      provider.updateTaskToFirestore(todo);
                      Navigator.pop(context);
                    }
                  }, child: Text(AppLocalizations.of(context)!.saveChanges),style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                  ),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DateTime selectedDate =DateTime.now();

  void selectDate() async{
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    if(chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {

    });
  }
}
