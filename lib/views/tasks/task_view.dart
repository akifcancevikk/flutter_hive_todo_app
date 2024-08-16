// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hive_todo_app/extensions/space_exs.dart';
import 'package:flutter_hive_todo_app/utils/app_str.dart';
import 'package:flutter_hive_todo_app/views/tasks/widget/task_view_appbar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
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
              Expanded(
                child: SizedBox(
                 child: Column(
                  children: [
                    Text(
                      MyString.titleOfTitleTextField,
                      style: textTheme.headlineMedium,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        child: TextFormField(
                          maxLines: 6,
                          cursorHeight: 60,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300
                              )
                            )
                          ),
                        ),
                      ),
                  ],
                 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}