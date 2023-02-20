import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import 'dart:io';

import '../providers/tasks.dart';

class FileBrain {
  static Future<List<Task>> read() async {
    List<Task> taskList = [];

    try {
      Directory directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/taskList.txt');
      String tasks = await file.readAsString();

      List<String> taskListString = tasks.split('\n');

      for (int i = 0; i < taskListString.length - 1; i += 3) {
        // Convert string to boolean
        bool state = false;
        (taskListString[i + 2] == 'true') ? state = true : state = false;

        taskList.add(
          Task(taskListString[i], taskListString[i + 1], state),
        );
      }
      return taskList;
    } catch (e) {
      debugPrint("Couldn't read file");
      return taskList;
    }
  }

  static Future save(List<Task> tasks) async {
    Directory directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/taskList.txt');
    String tasksString = '';
    for (var task in tasks) {
      tasksString += '${task.title}\n${task.desc}\n${task.state}\n';
    }
    file.writeAsString(
      tasksString.toString(),
    );
  }

  static saveAndWrite(BuildContext context) async {
    List<Task> tasks = Provider.of<Tasks>(context, listen: false).getTaskList;
    await FileBrain.save(tasks);
  }
}
