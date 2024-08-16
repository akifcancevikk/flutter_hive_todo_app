import 'package:flutter/material.dart';
import 'package:flutter_hive_todo_app/utils/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: AnimatedContainer(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: MyColors.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0,4),
              blurRadius: 10
            )
          ]
        ),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey, width: 0.8)
              ),
              child: const Icon(Icons.check, color: Colors.white,),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top:3, bottom: 5),
            child: Text(
              'Tamamlandı', 
              style: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.w500, 
                decoration: TextDecoration.lineThrough
                ),
              ),
          ),
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Açıklama", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Date", style: TextStyle(fontSize: 14, color: Colors.grey),),
                      Text("SubDate", style: TextStyle(fontSize: 12, color: Colors.grey),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}