import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatefulWidget {
  final snap;
  const CommentCard({Key? key, required this.snap}) : super(key: key);

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
            // backgroundColor: primaryColor,
            backgroundImage: NetworkImage(widget.snap["profilePic"]),
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
                      text: widget.snap['name'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: " ${widget.snap['text']}")
                ])),
                Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format(widget.snap['datePublished'].toDate()),
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
