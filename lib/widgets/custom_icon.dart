import 'package:flutter/material.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 47,
        width: 47,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white.withOpacity(0.07)),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            )));
  }
}