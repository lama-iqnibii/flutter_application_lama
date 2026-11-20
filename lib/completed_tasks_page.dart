import 'package:flutter/material.dart';
import 'task.dart';

class CompletedTasksPage extends StatelessWidget {
  final List<Task> completedTasks;

  CompletedTasksPage(this.completedTasks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed Tasks')),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                return Text(completedTasks[index].title);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}