import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffE2B35F),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Padding(
              padding: EdgeInsets.only(bottom: 25, top: 23, left: 16),
              child: Text(
                "Flutter Tips",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 16),
              child: Text(
                "Build Your Career With Sabri Waleed",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.4), fontSize: 20),
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.trash),
                color: Colors.black,
                iconSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24, bottom: 23),
            child: Text(
              "Feb 1,2025",
              style:
                  TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
