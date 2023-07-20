import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../models/storysModel.dart';

class StoryController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool imageUploading = false.obs;
  RxString selectedImage = "".obs;

  TextEditingController description = TextEditingController();

  final ImagePicker picker = ImagePicker();

  RxList<StorysModel> storys = RxList<StorysModel>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllStory();
  }

  void pickImage() async {
    if (await Permission.storage.request().isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        uploadImage(File(pickedFile.path));
        print("image selected ${pickedFile.path}");
      } else {
        print("no image selected");
      }
    } else {
      await Permission.storage.request();
      print("Grant permission and try again");
    }
  }

  void uploadImage(File file) async {
    imageUploading.value = true;
    var uuid = Uuid();
    var fileName = uuid.v1();
    var storageRef = FirebaseStorage.instance.ref().child("storys/$fileName");
    var uploadTask = storageRef.putFile(file);
    await uploadTask.whenComplete(() => null);
    print("image uploaded");
    storageRef.getDownloadURL().then((value) {
      print(value);
      selectedImage.value = value;
      Get.toNamed("/story-page");
    });
  }

  void addStory() async {
    try {
      var data = StorysModel(
        name: auth.currentUser!.displayName,
        email: auth.currentUser!.email,
        image: selectedImage.value,
        description: description.text,
        profileUrl: auth.currentUser!.photoURL,
        time: DateTime.now().toString(),
      ).toJson();
      await db.collection("story").add(data);
      print("storys added" + data.toString());
      imageUploading.value = false;
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void getAllStory() async {
    var res = await db.collection("story").get();

    storys.value = res.docs
        .map(
          (e) => StorysModel.fromJson(
            e.data(),
          ),
        )
        .toList();

    print(storys.length);
    print(storys[0].toJson());
  }
}
