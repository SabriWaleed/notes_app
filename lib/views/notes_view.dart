import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_cubit.dart';
import 'package:notes_app_/widgets/constatnts.dart';
import 'package:notes_app_/widgets/notes_view_body.dart';
import 'package:notes_app_/widgets/show_model_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  NotesViewBody(onSearch:(query){
          BlocProvider.of<NoteCubit>(context).searchNotes(query);
        } ,),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: kprimarycolor,
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return const ShowModelBottomSheet();
                });
          },
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
    );
  }
  
}

