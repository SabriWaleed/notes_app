import 'package:flutter/material.dart';
import 'package:notes_app_/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title,required this.icon, this.ontap});
  final String title;
  final IconData icon;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
          const Spacer(),
          CustomIcon(icon: icon, ontab: ontap,),
        ],
      ),
    );
  }
}
