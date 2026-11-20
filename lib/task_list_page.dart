import 'package:flutter/material.dart';
import 'task.dart';
import 'task_item.dart';
import 'completed_tasks_page.dart';

class TaskListPage extends StatefulWidget {
  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task('Task 1', false),
    Task('Task 2', false),
    Task('Task 3', false),
  ];

  int completedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Tasks')),
      body: Column(
        children: [
          Text('Completed: $completedCount / ${tasks.length}'),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  tasks[index],
                  (value) {
                    setState(() {
                      tasks[index].isCompleted = value;
                      if (value == true) {
                        completedCount++;
                      } else {
                        completedCount--;
                      }
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              List<Task> doneList = [];
              for (int i = 0; i < tasks.length; i++) {
                if (tasks[i].isCompleted == true) {
                  doneList.add(tasks[i]);
                }
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompletedTasksPage(doneList),
                ),
              );
            },
            child: Text('Completed Tasks'),
          ),
        ],
      ),
    );
  }
}