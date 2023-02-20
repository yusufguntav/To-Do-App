import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/pages/toDoPage.dart';
import '../providers/tasks.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        Provider.of<Tasks>(context, listen: false).declareTaskList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ToDoPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
