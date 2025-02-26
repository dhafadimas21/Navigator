import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  final String imagePath;

  const Todo(this.title, this.description, this.imagePath);
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Passing Data',
      home: TodosScreen(
        todos: <Todo>[
          Todo("Dimas", "Dhafa Dimas Hendrawan", "assets/samid.jpg"),
          Todo("Alip", "Muhammad Alif Assyauqi", "assets/alip.jpg"),
          Todo("Dudut", "Muhammad Aliansyah Baidowi", "assets/edo.jpg"),
          Todo("Arzy", "Arzy Febrian Adi Negara", "assets/arji.jpg"),
          Todo("Abdil", "Herman", "assets/abdil.jpg"),
        ],
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Siswa',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          todo.title,
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.black,
         iconTheme: const IconThemeData( 
          color: Colors.white, 
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              todo.imagePath,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 10),
            Text(
              todo.description,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}