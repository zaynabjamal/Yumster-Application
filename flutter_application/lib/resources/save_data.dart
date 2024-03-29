import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _firebaseStorage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveImage({required Uint8List file}) async {
    String resp = "some error occured";
    try {
      String imageUrl = await uploadImageToStorage("profile_images", file);
      //getting current user
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        //save image url along with user's UID
        await _firestore
            .collection("usersInfo")
            .doc(currentUser.uid)
            .update({"imageLink": imageUrl});
        // await _firestore
        //     .collection("usersInfo")
        //     .doc(currentUser.uid)
        //     .set({"imageLink": imageUrl});
        resp = "Success";
      }
      //await _firestore.collection("userInfo").add({"imageLink": imageUrl});
      else {
        resp = "User not authenticated";
      }
    } catch (err) {
      resp = err.toString();
      print("the error is: $err");
    }
    return resp;
  }
}
