import 'package:flutter/material.dart';

import '../config/colors.dart';

class ChatGoingBubble extends StatelessWidget {
  final String message;
  const ChatGoingBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(15),
          constraints: BoxConstraints(
            maxWidth: 400,
            minWidth: 100,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
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
