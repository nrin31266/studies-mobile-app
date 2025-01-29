import 'package:flutter/material.dart';

void main() {
  runApp(AffirmationToDoApp());
}

class AffirmationToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Affirmation To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AffirmationToDoScreen(),
    );
  }
}

class AffirmationToDoScreen extends StatefulWidget {
  @override
  _AffirmationToDoScreenState createState() => _AffirmationToDoScreenState();
}

class _AffirmationToDoScreenState extends State<AffirmationToDoScreen> {
  List<Map<String, dynamic>> affirmations = [
    {"text": "You are capable of achieving great things.", "isDone": false},
    {"text": "You are loved and appreciated.", "isDone": false},
    {"text": "You deserve happiness and success.", "isDone": false},
  ];

  final TextEditingController _textController = TextEditingController();

  void _addAffirmation(String text) {
    setState(() {
      affirmations.add({"text": text, "isDone": false});
    });
    _textController.clear();
    Navigator.of(context).pop();
  }

  void _toggleCompletion(int index) {
    setState(() {
      affirmations[index]['isDone'] = !affirmations[index]['isDone'];
    });
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add New Affirmation"),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: "Enter your affirmation",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _addAffirmation(_textController.text);
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Affirmation To-Do List"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: affirmations.length,
          itemBuilder: (context, index) {
            final affirmation = affirmations[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Checkbox(
                  value: affirmation['isDone'],
                  onChanged: (value) {
                    _toggleCompletion(index);
                  },
                ),
                title: Text(
                  affirmation['text'],
                  style: TextStyle(
                    fontSize: 18,
                    decoration: affirmation['isDone']
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
        tooltip: "Add new affirmation",
      ),
    );
  }
}
