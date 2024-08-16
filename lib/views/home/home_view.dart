// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_hive_todo_app/extensions/space_exs.dart';
import 'package:flutter_hive_todo_app/utils/app_colors.dart';
import 'package:flutter_hive_todo_app/utils/app_str.dart';
import 'package:flutter_hive_todo_app/utils/constants.dart';
import 'package:flutter_hive_todo_app/views/home/components/fab.dart';
import 'package:flutter_hive_todo_app/views/home/components/home_appbar.dart';
import 'package:flutter_hive_todo_app/views/home/components/slider_drawer.dart';
import 'package:flutter_hive_todo_app/views/home/widget/task_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<SliderDrawerState>drawerKey = GlobalKey();
  final List<int> testing = [];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FAB(),
        body: SliderDrawer(
          key: drawerKey,
          isDraggable: false,
          slider: CustomSliderDrawer(), 
          child: _buildHomeBody(textTheme, context),
          appBar: HomeAppbar(drawerKey: drawerKey,),
          ),
      ),
    );
  }

  Widget _buildHomeBody(TextTheme textTheme, BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: 1/3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(MyColors.primaryColor),
                  ),
                ),
                25.w,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MyString.mainTitle, style: textTheme.displayLarge,),
                    3.h,
                    Text("1/3 Görev", style: textTheme.titleMedium,)
                  ],
                )
              ],
            ),
            ),
            Expanded(
              child: SizedBox(
              width: double.infinity,
              child: testing.isNotEmpty
              ?ListView.builder(
                itemCount: testing.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      
                    },
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete_outline, color: Colors.grey,size: 25,),
                        10.w,
                        Text(MyString.deletedTask, style: TextStyle(fontSize: 16 ,color: Colors.grey),)
                      ],
                    ),
                    direction: DismissDirection.horizontal,
                    key: Key(index.toString()),
                    child: TaskWidget());
                },
              )
              : Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeIn(
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: Lottie.asset(lottieURL, animate: testing.isNotEmpty ? false:true
                        )
                      ),
                    ),
                    FadeInUp(from: 30,child: Text(MyString.doneAllTask))
                  ],
                ),
              )
                        ),
            )
        ],
      ),
    );
  }
}