// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hive_todo_app/extensions/space_exs.dart';
import 'package:flutter_hive_todo_app/utils/app_colors.dart';

class CustomSliderDrawer extends StatefulWidget {
   const CustomSliderDrawer({super.key});


  @override
  State<CustomSliderDrawer> createState() => _CustomSliderDrawerState();
}

class _CustomSliderDrawerState extends State<CustomSliderDrawer> {

  @override
  Widget build(BuildContext context) {
      final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  final List<String> texts = [
    "Ana Sayfa",
    "Profil",
    "Ayarlar",
    "Detaylar",
  ];
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 90),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: MyColors.primaryGradientColor,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://cdn-icons-png.flaticon.com/512/6596/6596121.png"
            ),
          ),
          8.h,
          Text("Akif Can Çevik", style: textTheme.displayMedium,),
          Text("Düz İnsan", style: textTheme.displaySmall,),

          Container(
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    debugPrint("${texts[index]} Tıklandı");
                  },
                  child: Container(
                    child: ListTile(
                      leading: Icon(icons[index], color: Colors.white,size: 30,),
                      title: Text(texts[index], style: TextStyle(color: Colors.white),),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}