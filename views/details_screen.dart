import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';

class DetailsScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context);
    return Scaffold(
      body: Center(
        child: Text('todos length: ${todos.todos.length}'),
        
      ),
    );
  }
}
