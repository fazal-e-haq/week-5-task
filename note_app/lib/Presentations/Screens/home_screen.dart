import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Presentations/Screens/add_note_screen.dart';
import 'package:note_app/Presentations/Screens/setting_screen.dart';
import 'package:note_app/Providers/notes_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String formatTime(DateTime time) {
    return '${time.day}/${time.month}/${time.year} '
        '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final note = context.watch<NotesProvider>().notes;

    return Scaffold(
      appBar: appBar(note, context),
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 16),
          child: gridViewForNotes(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
        child: Icon(Icons.note_alt_outlined, size: 32),
      ),
    );
  }

  GridView gridViewForNotes(BuildContext context) {
    return GridView.builder(
          itemCount: context.watch<NotesProvider>().notes.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            final note = context.watch<NotesProvider>().notes[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNoteScreen()),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: .circular(20),
                        color: Colors.black26,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(note.content, overflow: .ellipsis),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(note.title),
                  Text('${formatTime(note.createdAt)}'),
                ],
              ),
            );
          },
        );
  }

  AppBar appBar(List<NoteModel> note, BuildContext context) {
    return AppBar(
      title: isSearching
          ? TextField(
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(
                border: .none,
                hintText: 'Search notes',
              ),
            )
          : Column(
              crossAxisAlignment: .start,
              children: [
                Text('All Notes'),
                Text(
                  '${note.length} Notes',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
