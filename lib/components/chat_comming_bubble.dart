import 'package:flutter/material.dart';

import '../config/colors.dart';

class ChatCommingBubble extends StatelessWidget {
  final String message;
  const ChatCommingBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          constraints: BoxConstraints(
            maxWidth: 300,
            minWidth: 40,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
