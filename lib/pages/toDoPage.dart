// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/assets/constants.dart';
import 'package:to_do_app/pages/addTasks.dart';
import 'package:to_do_app/widgets/taskList.dart';

import '../providers/tasks.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await popUpAddTask(context);
          } catch (e) {
            debugPrint(
              e.toString(),
            );
          }
        },
        backgroundColor: kMainColor,
        child: const Icon(Icons.add),
      ),
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'TO-DO',
                  style: kHeaderTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: TaskList(),
            )
          ],
        ),
      ),
    );
  }

  Future<void> popUpAddTask(BuildContext context) async {
    List<String> titleAndDesc = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AddTasks(),
      ),
    );

    Provider.of<Tasks>(context, listen: false)
        .addTask(titleAndDesc[0], titleAndDesc[1], context);
  }
}
