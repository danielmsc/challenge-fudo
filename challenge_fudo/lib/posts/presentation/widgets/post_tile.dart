import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String title;
  final String body;

  const PostTile({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            body,
            textAlign: TextAlign.left,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
