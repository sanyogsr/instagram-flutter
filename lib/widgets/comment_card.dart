import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: primaryColor,
            radius: 16,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Username",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: " This is the comment you have written")
                ])),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    "22/11/22",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          )),
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.favorite_outline),
          )
        ],
      ),
    );
  }
}
