import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app_/models/note_model.dart';
import 'package:notes_app_/views/edit_note.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(note.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 25, top: 23, left: 16),
                child: Text(
                  note.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 16),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.4),
                      fontSize: 20),
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: IconButton(
                  onPressed: () {
                    note.delete();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Note Deleted!"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(FontAwesomeIcons.trash),
                  color: Colors.black,
                  iconSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, bottom: 23),
              child: Text(
                note.date,
                style:
                    // ignore: deprecated_member_use
                    TextStyle(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
