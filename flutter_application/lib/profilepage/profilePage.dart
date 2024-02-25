import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application/profilepage/Unit8List.dart';
import 'package:image_picker/image_picker.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? selectedImage;
    Future _pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
        selectedImage != null
        ? Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(selectedImage!,fit: BoxFit.cover,),),
          ],
        )
        : Container(
          child: Text("no image")
        )
        ]
      ),
    );
  }
}