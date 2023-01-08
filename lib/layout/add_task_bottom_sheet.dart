import 'package:flutter/material.dart';
import 'package:todo_list/shared/components/ui_utills.dart';
import '../models/tasks.dart';
import '../shared/network/local/firebase_utils.dart';
import '../shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  DateTime selectedDate=DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.addNewTask,
              textAlign: TextAlign.center
              ,style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: colorBlack,
              ),),
            SizedBox(height: 10,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    validator: (text){
                      if(text != null && text.isEmpty){
                        return AppLocalizations.of(context)!.pleaseEnterTaskTitle;
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.title,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: descriptionController,
                    validator: (text){
                      if(text != null && text.isEmpty){
                        return AppLocalizations.of(context)!.pleaseEnterTaskDescription;
                      }
                      return null;
                    },
                    maxLines: 2,
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.description,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),

                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text('${AppLocalizations.of(context)!.selectDate} :',style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: colorBlack,
            ),),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Text(
                '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontSize: 20,
                ),),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: (){
                if(formKey.currentState!.validate()){
                  Task task = Task(title: titleController.text,
                      description: descriptionController.text,
                      date:DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch);
                  showLoading('${AppLocalizations.of(context)!.loading}....', context);
                  addTaskFireStore(task).then((value) => {
                      hideLoading(context),
                      showMessage(context, AppLocalizations.of(context)!.tasksAddSuccessfully,
                        AppLocalizations.of(context)!.oK, () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                          //negBtn: 'Cansel',negAction: (){}
                      ),
                  }).catchError((error){
                    print(error);
                  });
                }
              },
              child: Text(AppLocalizations.of(context)!.addTask),
            ),
          ],
        ),
      ),
    );
  }
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
