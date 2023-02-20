import 'package:flutter/material.dart';
import 'package:to_do_app/utils/fileBrain.dart';

import '../models/task.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];
  declareTaskList() async {
    _tasks = await FileBrain.read();
    notifyListeners();
  }

  addTask(String taskTitle, String taskDesc, BuildContext context) {
    _tasks.add(
      Task(taskTitle, taskDesc, false),
    );

    FileBrain.saveAndWrite(context);
    notifyListeners();
  }

  List<Task> get getTaskList {
    return _tasks;
  }

  int get getTaskCount {
    return _tasks.length;
  }

  updateTaskStat(Task task, BuildContext context) {
    task.updateStat();
    FileBrain.saveAndWrite(context);
    notifyListeners();
  }

  removeTask(Task task, BuildContext context) {
    _tasks.remove(task);
    FileBrain.saveAndWrite(context);
    notifyListeners();
  }
}
