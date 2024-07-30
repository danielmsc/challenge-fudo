import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String title;
  final String body;
  final int userId;

  const PostTile({
    super.key,
    required this.title,
    required this.body,
    required this.userId,
  });

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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Id de usuario: ${userId.toString()}'),
        ),
        Text(
          body,
          textAlign: TextAlign.left,
        ),
        const Divider(),
      ],
    );
  }
}
