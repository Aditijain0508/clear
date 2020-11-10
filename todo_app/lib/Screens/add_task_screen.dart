import 'package:flutter/material.dart';
import 'package:todo_app/Models/Tasks_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/Models/NotificationHelper.dart';
import 'package:todo_app/Models/NotificationHelper.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle;

  @override
  void initState() {
    super.initState();
    notificationPlugin.setListenerForLowerVersion(onNotificationInLowerVersion);
    notificationPlugin.setOnNotificationClick(onNotificationClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                DatePicker.showDateTimePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2020, 11, 1, 5, 30),
                    maxTime: DateTime(2020, 11, 31, 5, 30), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) async {
                  await notificationPlugin.showNotification();
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);

                // context.read<TaskData>().addToDoTasks(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  onNotificationInLowerVersion(ReceivedNotification receivedNotification) {}

  onNotificationClicked(String payload) {}
}
