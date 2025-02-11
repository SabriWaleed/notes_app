import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_cubit.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_state.dart';
import 'package:notes_app_/models/note_model.dart';
import 'package:notes_app_/widgets/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        if (state is NoteLoaded) {
          List<NoteModel> notes = state.notes;
          return ListView.builder(
            itemCount: notes.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomNoteItem(note: notes[index]),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
