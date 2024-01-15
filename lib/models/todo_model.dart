// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDo {
  String? id;
  String? toDoText;
  bool isDone;
  ToDo({
    this.id,
    this.toDoText,
    required this.isDone,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(isDone: true, id: '01', toDoText: 'Morning walk'),
      ToDo(isDone: false, id: '02', toDoText: 'Morning excercise'),
      ToDo(isDone: true, id: '03', toDoText: 'Check email'),
      ToDo(isDone: true, id: '04', toDoText: 'Read one dart topic'),
      ToDo(isDone: false, id: '05', toDoText: 'attend meeting'),
      ToDo(isDone: true, id: '06', toDoText: 'Update the task'),
      ToDo(isDone: false, id: '07', toDoText: 'work on skills'),
      ToDo(isDone: true, id: '08', toDoText: 'learn something new'),
    ];
  }
}
