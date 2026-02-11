import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<NoteModel> _notes = [];
  List<NoteModel> get notes => _notes;

  void saveNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(note) {}

}
