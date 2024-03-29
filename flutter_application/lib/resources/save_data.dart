import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      String imageUrl = await uploadImageToStorage("images", file);
      await _firestore.collection("usersInfo").add({"imageLink": imageUrl});
      resp = "Success";
    } catch (err) {
      resp = err.toString();
    }
    return resp;
  }
}
