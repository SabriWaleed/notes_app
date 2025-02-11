import 'package:flutter/material.dart';
import 'package:notes_app_/widgets/constatnts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 130),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: kprimarycolor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "Add",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
