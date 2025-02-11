import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.ontab});
  final IconData icon;
  final void Function()? ontab;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            // ignore: deprecated_member_use
            color: Colors.white.withOpacity(0.07)),
        child: IconButton(
            onPressed: () {
              ontab!();
            },
            icon: Icon(
              icon,
              color: Colors.white,
              size: 30,
            )));
  }
}
