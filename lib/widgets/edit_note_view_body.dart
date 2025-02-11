import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_cubit.dart';
import 'package:notes_app_/models/note_model.dart';
import 'package:notes_app_/widgets/custom_app_bar.dart';
import 'package:notes_app_/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  late TextEditingController titleController;
  late TextEditingController contentController;
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
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.subtitle);
    selectedColor = Color(widget.note.color); 
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              ontap: () {
                widget.note.title = titleController.text;
                widget.note.subtitle = contentController.text;
                // ignore: deprecated_member_use
                widget.note.color = selectedColor.value;
                widget.note.date = DateFormat('yyyy-MM-dd – kk:mm:ss')
                    .format(DateTime.now()); 
                BlocProvider.of<NoteCubit>(context)
                    .updateNote(widget.note); 
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 32),
            CustomTextField(
              hint: "Title",
              controller: titleController,
            ),
            const SizedBox(height: 32),
            CustomTextField(
              hint: "Content",
              maxlines: 5,
              controller: contentController,
            ),
            const SizedBox(height: 32),
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
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
