// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/resources/firestore_methods.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils..dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool _isLoading = false;
  Uint8List? _file;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(String uid, String username, String profImage) async {
    try {
      _isLoading = true;
      String res = await FireStoreMethods().uploadPost(
          uid, _descriptionController.text, _file!, username, profImage);

      if (res == "success") {
        clearImage();
        _isLoading = false;
        showSnackBar(context, "Posted!");
      } else {
        _isLoading = false;
        showSnackBar(context, res);
      }
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    _selectImage(BuildContext context) {
      return showDialog(
          barrierColor: mobileBackgroundColor,
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return SimpleDialog(
              elevation: 77,
              // shadowColor: Colors.blueAccent.withOpacity(0.5),
              // shape: ShapeBorder(),

              title: Text('Create  a post'),
              children: [
                SimpleDialogOption(
                  padding: EdgeInsets.all(20),
                  child: Text('Take a photo'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImage(ImageSource.camera);
                    setState(() {
                      _file = file;
                    });
                  },
                ),
                SimpleDialogOption(
                  padding: EdgeInsets.all(20),
                  child: Text('Choose a photo'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Uint8List file = await pickImage(ImageSource.gallery);
                    setState(() {
                      _file = file;
                    });
                  },
                ),
                SimpleDialogOption(
                  padding: EdgeInsets.all(20),
                  child: Text('Cancel'),
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }

    return _file == null
        ? Center(
            child: IconButton(
                onPressed: () => _selectImage(context),
                icon: Icon(Icons.upload)),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              title: const Text('Post to'),
              leading: IconButton(
                  onPressed: clearImage, icon: const Icon(Icons.chevron_left)),
              actions: [
                TextButton(
                    onPressed: () => postImage(
                        userProvider.getUser.uid,
                        userProvider.getUser.username,
                        userProvider.getUser.photoUrl),
                    child: const Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            body: Column(
              children: [
                _isLoading
                    ? LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0)),
                const Divider(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          // backgroundColor: primaryColor,
                          backgroundImage:
                              NetworkImage(userProvider.getUser.photoUrl)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: 8,
                          decoration: InputDecoration(
                              hintText: "Write your Captions....",
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: AspectRatio(
                          aspectRatio: 487 / 451,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(_file!),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter),
                            ),
                          ),
                        ),
                      ),
                      const Divider()
                    ])
              ],
            ),
          );
  }
}
