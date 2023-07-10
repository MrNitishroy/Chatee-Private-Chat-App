import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/storysModel.dart';

class StoryController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController description = TextEditingController();

  final ImagePicker picker = ImagePicker();

  void pickImage() async {
    try {
      if (await Permission.storage.request().isGranted) {
        print("granted");
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          print(image.path);
          // addStory();
        }
      } else {
        await Permission.storage.request();
      }
    } catch (e) {
      print(e);
    }
  }

  void addStory() async {
    try {
      var data = StorysModel(
        name: auth.currentUser!.displayName,
        email: auth.currentUser!.email,
        image: "",
        description: description.text,
        time: DateTime.now().toString(),
      ).toJson();

      await db.collection("story").add(data);
      print("storys added" + data.toString());
    } catch (e) {
      print(e);
    }
  }
}
