import 'package:flutter/cupertino.dart';
import 'package:my_app/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [];

  addNewTodo(title, description) {
    var newtodo = Todo(title: title, description: description);
    todos.add(newtodo);
    notifyListeners();
  }

  deletetodo(index) {
    todos.removeAt(index);
    notifyListeners();
  }
}
