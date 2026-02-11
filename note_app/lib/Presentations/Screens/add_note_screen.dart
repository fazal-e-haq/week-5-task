import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Providers/notes_provider.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});

  final titleController = TextEditingController();
  final contentController = TextEditingController();
  late NoteModel note = NoteModel(
    id: DateTime.now().microsecondsSinceEpoch.toString(),
    title: titleController.text,
    content: contentController.text,
    createdAt: DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add note')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: 'Content',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  minLines: 23,
                  maxLines: 100,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromWidth(500)),
                  ),
                  onPressed: () {
                    context.read<NotesProvider>().saveNote(note);
                    Navigator.pop(context);
                  },
                  child: Text('Save note'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
