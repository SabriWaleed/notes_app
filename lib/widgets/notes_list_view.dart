import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      // ignore: prefer_const_constructors
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: const CustomNoteItem(),
      );
    });
  }
}
