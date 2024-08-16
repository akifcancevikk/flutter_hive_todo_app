// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class HomeAppbar extends StatefulWidget {
   const HomeAppbar({super.key, required this.drawerKey});

  final GlobalKey<SliderDrawerState>drawerKey;

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  bool isDrawerOpen = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  void onDrawerToggle(){
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if(isDrawerOpen){
        animationController.forward();
        widget.drawerKey.currentState!.openSlider();
      }else{
        animationController.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top:20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15),
              child: IconButton(onPressed: () {
                onDrawerToggle();
              }, icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animationController, size: 40,)),
            ),
            Padding(
              padding: const EdgeInsets.only(right:15),
              child: IconButton(onPressed: () {
                
              }, icon: Icon(Icons.delete, size: 40,)),
            ),
          ],
        ),
      ),
    );
  }
}