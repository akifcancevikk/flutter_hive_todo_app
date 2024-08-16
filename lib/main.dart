// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hive_todo_app/views/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(
              color: Colors.black,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w300
            ),
            displayMedium: TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
            displaySmall: TextStyle(
              color: Color.fromARGB(255, 234, 234, 234),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            headlineMedium: TextStyle(
              color: Colors.grey,
              fontSize: 17
            ),
            headlineSmall: TextStyle(
              color: Colors.grey,
              fontSize: 16
            ),
            titleSmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),titleLarge: TextStyle(
              fontSize: 40,
              color: Colors.black,
              fontWeight: FontWeight.w300
            )
          )
        ),
        home: HomeView(),
      ),
    );
  }
}
