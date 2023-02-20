import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/assets/constants.dart';
import 'package:to_do_app/widgets/taskTile.dart';

import '../providers/tasks.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: kTaskListBackgroundDecoration,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 50),
        child: Consumer<Tasks>(
          builder: (context, tasks, child) {
            return Column(
              children: [
                Text('${tasks.getTaskCount} task'),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return TaskTile(
                        task: tasks.getTaskList[index],
                        desc: tasks.getTaskList[index].desc,
                        isCompleted: tasks.getTaskList[index].state,
                        cbCallback: (cbStat) {
                          tasks.updateTaskStat(
                              tasks.getTaskList[index], context);
                        },
                      );
                    },
                    itemCount: tasks.getTaskCount,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
