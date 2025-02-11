import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_state.dart';
import 'package:notes_app_/models/note_model.dart';
import 'package:notes_app_/widgets/constatnts.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial()) {
    fetchAllNotes();
    _listenToHive();
  }

  bool isSearching = false;

  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(khiveflutter);
    final notes = List<NoteModel>.from(notesBox.values)
      ..sort(
          (a, b) => b.date.compareTo(a.date));
    isSearching = false;
    emit(NoteLoaded(notes));
  }

  void resetNotes() {
    fetchAllNotes();
  }

  Future<void> addNote(NoteModel note) async {
    var notesBox = Hive.box<NoteModel>(khiveflutter);
    await notesBox.add(note);
  }

  Future<void> updateNote(NoteModel note) async {
    // ignore: unused_local_variable
    var notesBox = Hive.box<NoteModel>(khiveflutter);
    await note.save(); 
    fetchAllNotes(); 
  }

  void searchNotes(String query) {
    var notesBox = Hive.box<NoteModel>(khiveflutter);
    final notes = notesBox.values
        .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    isSearching = true;
    emit(NoteLoaded(notes));
  }

  void _listenToHive() {
    var notesBox = Hive.box<NoteModel>(khiveflutter);
    notesBox.listenable().addListener(() {
      fetchAllNotes();
    });
  }
}
