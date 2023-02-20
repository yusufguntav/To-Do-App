import 'package:flutter/material.dart';
import 'package:to_do_app/assets/constants.dart';
import 'package:to_do_app/widgets/customButton.dart';
import 'package:to_do_app/widgets/textBox.dart';

class AddTasks extends StatefulWidget {
  const AddTasks({super.key});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  TextEditingController title = TextEditingController();

  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: kHeaderTextStyle.copyWith(fontSize: 30, color: kMainColor),
            ),
            TextBox(
              textController: title,
              textLabel: 'Task Title',
            ),
            TextBox(
              textController: desc,
              textLabel: 'Task description',
            ),
            CustomButton(
              buttonOnpress: () {
                Navigator.pop(
                  context,
                  [
                    title.text,
                    desc.text,
                  ],
                );
              },
              buttonText: 'Add',
            )
          ],
        ),
      ),
    );
  }
}
