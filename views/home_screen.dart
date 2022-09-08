import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/provider/todo_provider.dart';
import 'package:my_app/views/details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  int _counter = 0;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('todos length: ${todos.todos.length}'),
        actions: [
          IconButton(
                  onPressed: () => Navigator.push(
        context, CupertinoPageRoute(builder: (_) => DetailsScreen())),
                  icon: Icon(Icons.arrow_forward),
        ),
        ],
        ),
        
        
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text('Title'),
                      content: Column(
                        children: [
                          TextField(
                            controller: _titleController,
                            decoration: InputDecoration(hintText: 'Title'),
                          ),
                          TextField(
                            controller: _descriptionController,
                            decoration:
                                InputDecoration(hintText: 'Description'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final title = _titleController.text;
                              final description = _descriptionController.text;
                              todos.addNewTodo(title, description);
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                          ),
                        ],
                      ),
                    ));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: todos.todos.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(todos.todos[index].title),
                subtitle: Text(todos.todos[index].description),
                trailing: IconButton(
                  onPressed: () => todos.deletetodo(index),
                  icon: Icon(Icons.remove_circle_outline_outlined),
                ),
              );
            }),
      ),
    );
  }
}
