// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:flutter_hive_todo_app/extensions/space_exs.dart';
import 'package:flutter_hive_todo_app/utils/app_colors.dart';
import 'package:flutter_hive_todo_app/utils/app_str.dart';
import 'package:flutter_hive_todo_app/views/tasks/components/date_time_selection.dart';
import 'package:flutter_hive_todo_app/views/tasks/components/rep_textfield.dart';
import 'package:flutter_hive_todo_app/views/tasks/widget/task_view_appbar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descrptionTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: TaskViewAppbar(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                    ),
                    5.w,
                    RichText(
                      text: TextSpan(
                        text: MyString.addNewTask, 
                        style: textTheme.titleLarge,
                     )
                    ),
                    5.w,
                     Expanded(
                       child: SizedBox(
                        child: Divider(
                          thickness: 2,
                        ),
                       ),
                     ),
                  ],
                ),
              ),
              _buildMainTaskViewActivity(textTheme, context),
              _buildBottomSideButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSideButtons() {
    return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                    
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  minWidth: 150,
                  height: 55,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(Icons.close, color: MyColors.primaryColor,),
                      5.w,
                      Text(MyString.deleteTask, style: TextStyle(color: MyColors.primaryColor),),
                    ],
                  ),
                 ),
                  MaterialButton(
                    onPressed: () {
                    
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  minWidth: 150,
                  height: 55,
                  color: MyColors.primaryColor,
                  child: Text(MyString.addTaskString, style: TextStyle(color: Colors.white),),
                 ),
                ],
              ),
              );
  }

  Widget _buildMainTaskViewActivity(TextTheme textTheme, BuildContext context) {
    return Expanded(
              child: SizedBox(
               child: Column(
                children: [
                  Text(
                    MyString.titleOfTitleTextField,
                    style: textTheme.headlineMedium,
                    ),
                    RepTextField(controller: titleTaskController),
                    10.h,
                    RepTextField(
                      controller: descrptionTaskController,
                      isForDescription: true,
                      ),
                    DateTimeSelection(
                      title: MyString.timeString,
                      onTap: () {
                      showModalBottomSheet(context: context, builder: (context) {
                        return SizedBox(
                            height: 280,
                            child: TimePickerWidget(
                              onChange: (dateTime, selectedIndex) {
                                
                              },
                              dateFormat: 'HH:mm',
                              onConfirm: (dateTime, selectedIndex) {
                                
                              },
                            ),
                          );
                        },);
                    },
                  ),  
                    DateTimeSelection(
                      title: MyString.dateString,
                      onTap: () {
                      DatePicker.showDatePicker(
                        context,
                        maxDateTime: DateTime(2030,4,5),
                        minDateTime: DateTime.now(),
                        onConfirm: (dateTime, selectedIndex) {
                          
                        },
                        );
                    },
                  ),  
                ],
               ),
              ),
            );
  }
}

