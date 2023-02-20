import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:to_do_app/assets/constants.dart';

import '../models/task.dart';
import '../providers/tasks.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.isCompleted,
    required this.desc,
    required this.cbCallback,
  });
  final Task task;
  final String desc;
  final bool isCompleted;
  final Function(bool? cbStat) cbCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        bool answer = false;
        Alert(
          context: context,
          title: "Delete",
          desc: "Are you sure about deleting the task ?",
          buttons: [
            DialogButton(
              color: kMainColor,
              onPressed: () {
                answer = true;
                Navigator.pop(context);
              },
              child: const Text(
                'Yes',
              ),
            ),
            DialogButton(
              color: kMainColor,
              onPressed: () {
                answer = false;
                Navigator.pop(context);
              },
              child: const Text(
                'No',
              ),
            ),
          ],
        ).show().then((_) => answer == true
            ? Provider.of<Tasks>(context, listen: false)
                .removeTask(task, context)
            : null);
      },
      title: Text(
        task.title,
        style: TextStyle(
          decoration: (isCompleted) ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        desc,
        style: TextStyle(
          decoration: (isCompleted) ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isCompleted,
        onChanged: cbCallback,
      ),
    );
  }
}
