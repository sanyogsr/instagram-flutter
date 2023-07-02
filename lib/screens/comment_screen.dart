import 'package:flutter/material.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/resources/firestore_methods.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final snap;
  const CommentScreen({Key? key, required this.snap}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text("comments"),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        padding: EdgeInsets.only(left: 16, right: 8, bottom: 10),
        child: Row(
          children: [
            CircleAvatar(
              // backgroundColor: primaryColor,
              radius: 16,
              backgroundImage: NetworkImage(user.photoUrl),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                      hintText: "Comment as ${user.username} ",
                      border: InputBorder.none),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                print("post tapped");
                await FireStoreMethods().postComment(
                  user.uid,
                  widget.snap["postId"],
                  user.username,
                  _commentController.text,
                  user.photoUrl,
                );
              },
              child: Container(
                child: Text(
                  'Post',
                  style: TextStyle(
                    color: blueColor,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
      body: CommentCard(),
    );
  }
}
