import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Upload/utils.dart';
import 'package:flutter_application/data/contact_us.dart';
import 'package:flutter_application/resources/save_data.dart';
import 'package:flutter_application/screens/about_us.dart';
import 'package:flutter_application/screens/help_screen.dart';
import 'package:flutter_application/welcome_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  // upload image

  // Taking id as a paramater for updating
  void selectedImage(userId) async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;

      // THIS IS EXTRA AND USELESS ↙️
      // saveProfile();
    });

    // Passing image to uploading provider [StoreData]
    // Also Passing user id for updating exactly logged in user record ↘️
    try {
      if (_image != null) {
        String resp =
            await StoreData().saveImage(file: _image!, userID: userId);
        print(resp);
      } else {
        print("No image selected");
      }
    } catch (error) {
      print("Error uploading image: $error");
    }
  }

  // void saveProfile() async {}

  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  //all users
  final usersCollection = FirebaseFirestore.instance.collection("usersInfo");
  //edit username
  Future<void> editUserName(String edit) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: const Color(0xffFCFCF8),
              surfaceTintColor: const Color(0xffFCFCF8),
              title: Text(
                "Edit $edit",
                style: const TextStyle(
                  color: Color(0xffFE9801),
                ),
              ),
              content: TextField(
                autofocus: true,
                cursorColor: const Color(0xff697C37),
                style: const TextStyle(color: Color(0xff697C37)),
                decoration: InputDecoration(
                  hintText: "Enter new $edit",
                  hintStyle: const TextStyle(color: Color(0xffB0AA86)),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff697C37)),
                  ),
                ),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Color(0xff697C37)),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newValue),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Color(0xff697C37)),
                    ))
              ],
            ));
    //update in firestore
    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.email).update({edit: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCF8),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("usersInfo")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            //get user data

            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;

              // print();
              return Scaffold(
                backgroundColor: const Color(0xffFCFCF8),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.sizeOf(context).height * 0.02,
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.05),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                _image != null
                                    ? CircleAvatar(
                                        radius: 40,
                                        backgroundImage: MemoryImage(_image!),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage: userData[
                                                    'imageLink'] !=
                                                null
                                            ? NetworkImage(
                                                userData['imageLink'])
                                            : const AssetImage(
                                                    "assets/circleAvatar.jpg")
                                                as ImageProvider,
                                      ),
                                Positioned(
                                  bottom: -10,
                                  left: 40,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () =>
                                            selectedImage(snapshot.data?.id),
                                        icon: const Icon(Icons.add_a_photo),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Gap(MediaQuery.sizeOf(context).width * 0.03),
                            Text(
                              userData["Username"],
                              style: const TextStyle(
                                  color: Color(
                                    0xFF697C37,
                                  ),
                                  fontFamily: 'Rowdies',
                                  fontSize: 24),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => editUserName("Username"),
                              icon: const Icon(
                                Icons.edit,
                                color: Color(0xFFFE9801),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0,
                        color: Color(0xFFB0AA86),
                      ),
                      Gap(MediaQuery.sizeOf(context).width * 0.04),
                      Container(
                        width: 330,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9F1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 1,
                                spreadRadius: 0),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Gap(16),
                                Icon(
                                  Icons.email_outlined,
                                  color: Color(0xFFFE9801),
                                ),
                                Gap(8),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontFamily: 'Rowdies',
                                    fontSize: 16,
                                    color: Color(0xFF697C37),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 190),
                              child: Text(
                                userData["Email"],
                                style: const TextStyle(
                                  fontFamily: 'Rowdies',
                                  fontSize: 10,
                                  color: Color(0xffB0AA86),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Gap(12),
                      Container(
                        width: 330,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9F1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 1,
                                spreadRadius: 0),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ContactUs()),
                            );
                          },
                          child: Container(
                            width: 330,
                            height: 52,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF9F1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 1,
                                    spreadRadius: 0),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child:
                                      SvgPicture.asset("assets/contactus.svg"),
                                ),
                                const Gap(12),
                                const Text(
                                  "Contact Us",
                                  style: TextStyle(
                                    fontFamily: 'Rowdies',
                                    fontSize: 16,
                                    color: Color(0xFF697C37),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()),
                          );
                        },
                        child: Container(
                          width: 330,
                          height: 52,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFF9F1),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                  blurRadius: 1,
                                  spreadRadius: 0),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset("assets/aboutUs.svg"),
                              ),
                              const Gap(12),
                              const Text(
                                "About Us",
                                style: TextStyle(
                                  fontFamily: 'Rowdies',
                                  fontSize: 16,
                                  color: Color(0xFF697C37),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(12),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Help()),
                          );
                        },
                        child: Container(
                          width: 330,
                          height: 52,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFF9F1),
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 1),
                                  blurRadius: 1,
                                  spreadRadius: 0),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset("assets/aboutUs.svg"),
                              ),
                              const Gap(12),
                              const Text(
                                "Help",
                                style: TextStyle(
                                  fontFamily: 'Rowdies',
                                  fontSize: 16,
                                  color: Color(0xFF697C37),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const Gap(12),
                      Container(
                        width: 330,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9F1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                blurRadius: 1,
                                spreadRadius: 0),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Gap(12),
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Welcome()));
                              },
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: Color(0xFFFE9801),
                              ),
                            ),
                            const Text(
                              "Log Out",
                              style: TextStyle(
                                fontFamily: 'Rowdies',
                                fontSize: 16,
                                color: Color(0xFFFE9801),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error${snapshot.error}"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
