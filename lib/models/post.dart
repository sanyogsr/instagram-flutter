// import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String desccription;
  final String uid;
  final String username;
  final String postId;
  final dataPublished;
  final String postUrl;
  final String profImage;
  final likes;

  Post(
      {required this.desccription,
      required this.uid,
      required this.username,
      required this.postId,
      required this.dataPublished,
      required this.postUrl,
      required this.profImage,
      required this.likes});

  // static User fromSnap(DocumentSnapshot snap) {
  //   var snapshot = snap.data() as Map<String, dynamic>;

  //   return User(
  //       email: snapshot['email'],
  //       uid: snapshot['uid'],
  //       photoUrl: snapshot['photoUrl'],
  //       username: snapshot['username'],
  //       bio: snapshot['bio'],
  //       followers: snapshot?['followers'] ?? [],
  //       following: snapshot?['following'] ?? []);
  // }
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = (snap.data() as Map<String, dynamic>);

    return Post(
        desccription: snapshot['desccription'],
        uid: snapshot['uid'],
        username: snapshot['username'],
        postId: snapshot['postId'],
        dataPublished: snapshot['dataPublished'],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        likes: snapshot['likes']);
  }

  Map<String, dynamic> toJson() => {
        "description": desccription,
        "uid": uid,
        "username": username,
        "postId": postId,
        "datePublished": dataPublished,
        "postUrl": postUrl,
        "profImage": profImage,
        "likes": likes
      };
}
