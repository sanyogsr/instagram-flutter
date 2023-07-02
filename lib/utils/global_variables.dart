// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagram/screens/add_post.dart';
import 'package:instagram/screens/feed_screen.dart';
import 'package:instagram/screens/logout.dart';
import 'package:instagram/screens/profile_screen.dart';
import 'package:instagram/screens/search_screen.dart';

List<StatefulWidget> homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPost(),
  Logout(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  )
];
