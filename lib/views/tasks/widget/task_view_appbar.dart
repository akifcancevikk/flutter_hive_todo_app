// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TaskViewAppbar extends StatefulWidget implements PreferredSizeWidget {
   const TaskViewAppbar({super.key});

  @override
  State<TaskViewAppbar> createState() => _TaskViewAppbarState();
  
  @override
  Size get preferredSize => Size.fromHeight(150);
}

class _TaskViewAppbarState extends State<TaskViewAppbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_rounded))
          ],
        ),
      ),
    );
  }
}