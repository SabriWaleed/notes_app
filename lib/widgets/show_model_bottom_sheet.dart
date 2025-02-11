import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/add_notes_cubit.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/add_notes_state.dart';
import 'package:notes_app_/widgets/add_note_form_sheet.dart';

class ShowModelBottomSheet extends StatelessWidget {
  const ShowModelBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: BlocConsumer<NotesCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteFailure) {
                debugPrint("Failed");
              }
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is AddNoteLoading ? true : false,
                child: ModalProgressHUD(
                    inAsyncCall: state is AddNoteLoading ? true : false,
                    child: AddNoteFormSheet()),
              );
            },
          ),
        ),
      ),
    );
  }
}
