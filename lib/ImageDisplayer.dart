import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  bool singerValue = false;
  bool producerValue = false;
  bool instrumentValue = false;
  bool engineValue = false;
  late List<bool> arr;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return ColorfulSafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff0e0e15),
            body: Center(
              child: Column(
                children: [
                  CupertinoButton(
                      child: Text("Subcollection create"),
                      onPressed: () {
                        getter();
                      }),
                  CupertinoButton(
                      child: Text("Link get"),
                      onPressed: () async {
                        print(await getUrl());
                      }),
                ],
              ),
            )));
  }

  void getter() {
    final databaseReference = FirebaseFirestore.instance;
    databaseReference
        .collection('tester')
        .doc('vikram sharma')
        .collection('song2')
        .doc('song2')
        .set({"test": 'vikram test'});
  }

  void link() {}

  Future<String> getUrl() async {
    final ref = FirebaseStorage.instance.ref().child('test/tester');
    var url = await ref.getDownloadURL();
    return url;
  }
}
