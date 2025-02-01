import 'package:flutter/material.dart';
import 'package:notesapp/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: const Row(
        children: [
          Text(
            "Notes",
            style: TextStyle(fontSize: 32),
          ),
          Spacer(),
          CustomIcon(),
        ],
      ),
    );
  }
}
