import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.deleteFunction});

final String taskName;
final bool taskCompleted;
final Function(bool?)? onChanged;
final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left:15,
        right:15,
        bottom:0
        ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade500,
              borderRadius: BorderRadius.circular(15),
            )
          ]
          ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple
          ),
          child: Row(
              children: [
                Checkbox(
                  value: taskCompleted, 
                  onChanged: onChanged,
                  activeColor: Colors.white,
                  checkColor: Colors.deepPurple,
                  side: const BorderSide(color: Colors.white),
                  ),
                Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                  decorationThickness: 4,
                ),
              )
            ],
          ) 
        ),
      ),
    );
  }
}