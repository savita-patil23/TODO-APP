import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/todo_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final toDoList = ToDo.todoList();
  var titleController = TextEditingController();
  var searchController = TextEditingController();

  List<ToDo> toDoFound = [];

  final String image =
      'https://assets.vogue.in/photos/60ca4a4596d470590e0c7cc6/1:1/w_960,c_limit/Shraddha%20Kapoor%20on%20self-care,%20skincare%20and%20the%20beauty%20product%20she\'d%20love%20to%20create%20.jpg';

  @override
  void initState() {
    super.initState();
    toDoFound = toDoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              size: 30,
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(image),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      onChanged: (value) => runFilter(value),
                      controller: searchController,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 20,
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIconConstraints:
                              BoxConstraints(maxHeight: 20, minWidth: 25),
                          border: InputBorder.none),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 50, bottom: 20),
                          child: const Text(
                            'All TODO\'s',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (ToDo todos in toDoFound)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ToDoItem(
                              todo: todos,
                              onToDoChanged: onToDOChange,
                              deleteItem: () {
                                onDelete(todos.id!);
                              },
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0)
                          ]),
                      child: TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add a new todo item',
                            contentPadding: EdgeInsets.all(8)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {
                        addToDo(titleController.text);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onToDOChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  onDelete(String id) {
    setState(() {
      toDoList.removeWhere((element) => element.id == id);
    });
  }

  addToDo(String title) {
    setState(() {
      toDoList.add(ToDo(
          isDone: false,
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          toDoText: title));
    });
    titleController.clear();
  }

  runFilter(String keyword) {
    List<ToDo> results = [];
    if (searchController.text.isEmpty) {
      results = toDoList;
    } else {
      results = toDoList
          .where((element) =>
              element.toDoText!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      toDoFound = results;
    });
  }
}
