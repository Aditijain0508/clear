import 'package:flutter/material.dart';
import 'Screens/ToDoScreen.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/Tasks_data.dart';
import 'package:todo_app/Screens/StartUp_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.green,
          body: StartUpScreen(),
        ),
      ),
    );
  }
}
