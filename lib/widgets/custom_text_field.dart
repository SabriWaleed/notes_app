import 'package:flutter/material.dart';
import 'package:notes_app_/widgets/constatnts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.maxlines = 1,
    this.onsaved,
    this.controller,
  });

  final String hint;
  final int maxlines;
  final void Function(String?)? onsaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "field is required";
        } else {
          return null;
        }
      },
      maxLines: maxlines,
      cursorColor: kprimarycolor,
      decoration: InputDecoration(
        hintText: hint,
        // ignore: deprecated_member_use
        hintStyle: TextStyle(color: kprimarycolor.withOpacity(0.4)),
        border: inputBorder(),
        enabledBorder: inputBorder(),
        focusedBorder: inputBorder(kprimarycolor),
      ),
    );
  }
}

OutlineInputBorder inputBorder([Color color = Colors.white]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color),
  );
}
