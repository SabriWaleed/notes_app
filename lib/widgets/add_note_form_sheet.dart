import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/add_notes_cubit.dart';
import 'package:notes_app_/models/note_model.dart';
import 'package:notes_app_/widgets/custom_button.dart';
import 'package:notes_app_/widgets/custom_text_field.dart';

class AddNoteFormSheet extends StatefulWidget {
  const AddNoteFormSheet({super.key});

  @override
  State<AddNoteFormSheet> createState() => _AddNoteFormSheetState();
}

class _AddNoteFormSheetState extends State<AddNoteFormSheet> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  Color selectedColor = Colors.orange;

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: 'Title',
            onsaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'Content',
            onsaved: (value) {
              subtitle = value;
            },
            maxlines: 5,
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: colors.map((color) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = color;
                  });
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: selectedColor == color
                        ? Border.all(color: Colors.black, width: 2)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          CustomButton(
            ontap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                var noteModel = NoteModel(
                  title: title!,
                  subtitle: subtitle!,
                  date: DateFormat('yyyy-MM-dd – kk:mm:ss').format(DateTime.now()),
                  // ignore: deprecated_member_use
                  color: selectedColor.value,
                );
                BlocProvider.of<NotesCubit>(context).addnote(noteModel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
