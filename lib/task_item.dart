import 'package:flutter/material.dart';
import 'task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function onChanged;

  TaskItem(this.task, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(task.title),
        Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ],
    );
  }
}