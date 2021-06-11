import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ishare/utills/colors.dart';
class MessageBubble extends StatelessWidget {
  final String message;
  final String sender;
  final bool isMe;

  MessageBubble(this.message, this.sender, this.isMe);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
        Material(
          color: AppColors().liteColorWithOpacity(1.0),
          borderRadius:
            isMe ? BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)
            ): BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0)
            ),
          elevation: 5.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              message, style: TextStyle(
              fontSize: 18.0
            ),
            ),
          ),
        )
      ],
    );
  }
}
