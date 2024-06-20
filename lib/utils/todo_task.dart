import 'package:flutter/material.dart';

class TodoTask extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onStatusChanged;

  const TodoTask({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onStatusChanged,
            activeColor: Colors.green,
          ),
          Text(
            taskName,
            style: TextStyle(
              decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ]),
      ),
    );
  }
}
