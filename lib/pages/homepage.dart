import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utlis/todolist.dart';

class Homepage extends StatefulWidget {
    const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    List todolist = [
      ['Learn Andriod Development', false],
      ['Learn Web Development', false],
    ];

    void checkboxChanged(int index) {
      setState(() {
        todolist[index][1] = !todolist[index][1];
      });
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurple.shade300,
        appBar: AppBar(
          title: const Text('Todo List'),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(itemCount: todolist.length, itemBuilder: (BuildContext context, index){
          return TodoList(
            taskName: todolist[index][0],
            taskCompleted: todolist[index][1],
            onChanged: (value) => checkboxChanged(index),
          );
        })
      );
    }
}