// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/models/todo_model.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    Key? key,
    required this.todo,
    required this.deleteItem,
    required this.onToDoChanged,
  }) : super(key: key);

  final ToDo todo;
  final onToDoChanged;
  final deleteItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.toDoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.red),
          child: IconButton(
              icon: const Icon(Icons.delete),
              iconSize: 18,
              color: Colors.white,
              onPressed: deleteItem),
        ),
      ),
    );
  }
}
