import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_cubit.dart';
import 'package:notes_app_/cubits/add%20_note_cubit/note_state.dart';
import 'package:notes_app_/widgets/custom_app_bar.dart';
import 'package:notes_app_/widgets/notes_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key, this.onSearch});
  final void Function(String)? onSearch;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            ontap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Search Note"),
                    content: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Enter note title",
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          if (searchController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please enter a search term!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            onSearch!(searchController.text);
                            Navigator.pop(context);
                            searchController.clear();
                          }
                        },
                        child: const Text("Search"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16),
          BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              bool isSearching =
                  BlocProvider.of<NoteCubit>(context).isSearching;

              return isSearching
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          BlocProvider.of<NoteCubit>(context).resetNotes();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          width: 100,
                          height: 25,
                          child: const Text(
                            textAlign: TextAlign.center,
                            "Show All",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
          const SizedBox(height: 16),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
