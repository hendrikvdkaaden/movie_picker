import 'package:flutter/material.dart';

class GenreHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const GenreHeader({
    super.key,
    required this.title,
    this.icon = Icons.arrow_right, // Default icon is arrow_right
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Icon(icon, color: Colors.black),
      ],
    );
  }
}
