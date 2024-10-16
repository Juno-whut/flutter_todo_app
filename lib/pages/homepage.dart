import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utlis/todolist.dart';

class Homepage extends StatefulWidget {
    const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

    final _controller = TextEditingController();
    List todolist = [
      ['Learn Andriod Development', false],
      ['Learn Web Development', false],
    ];

    void checkboxChanged(int index) {
      setState(() {
        todolist[index][1] = !todolist[index][1];
      });
    }

    void saveNewTask() {
      setState(() {
        todolist.add([_controller.text, false]);
        _controller.clear();
      });
    }

    void deleteTask(int index) {
      setState(() {
        todolist.removeAt(index);
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
            deleteFunction: (value) => deleteTask(index),
          );
        }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add New Task',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15),
                    )
                  )
                ),
              )),
              FloatingActionButton(
                onPressed: saveNewTask,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      );
    }
}