import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
              title: Text(
                "Edit" + edit,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              content: TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter new $edit",
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "cancle",
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(newValue),
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ));
    //update in firestore
    if (newValue.trim().length > 0) {
      await usersCollection.doc(currentUser.email).update({edit: newValue});
    }
  }

  @override
  // void initState() {
  //   super.initState();
  //   fetchUserData();
  // }

  // Future<void> fetchUserData() async {
  //   final currentUser = FirebaseAuth.instance.currentUser;
  //   if (currentUser != null) {
  //     String emailOrUsername =
  //         widget.userEmailOrUsername ?? currentUser.email ?? "";

  //     if (emailOrUsername.contains("@gmail.com")) {
  //       setState(() {
  //         _userEmail = emailOrUsername;
  //       });
  //     } else {
  //       final snapshot = await FirebaseFirestore.instance
  //           .collection("usersInfo")
  //           .where("Username", isEqualTo: emailOrUsername)
  //           .get();

  //       if (snapshot.docs.isNotEmpty) {
  //         final userData = snapshot.docs.first.data();
  //         final String userEmail = userData["Email"];

  //         setState(() {
  //           _userEmail = userEmail;
  //         });
  //       }
  //     }
  //   }
  // }

  File? selectedImage;

  Future<void> _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("usersInfo")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            //get user data

            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(42),
                    Row(
                      children: [
                        const Gap(15),
                        Stack(
                          children: [
                            InkWell(
                              onTap: _pickImageFromGallery,
                              child: selectedImage != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        selectedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const CircleAvatar(
                                      radius: 32,
                                      backgroundColor: Color(0xFFFE9801),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(
                                            "assets/circleAvatar.jpg"),
                                      ),
                                    ),
                            ),
                            if (selectedImage == null)
                              Positioned(
                                bottom: -10,
                                right: -10,
                                child: IconButton(
                                  onPressed: _pickImageFromGallery,
                                  icon: const Icon(Icons.add_a_photo),
                                ),
                              ),
                          ],
                        ),
                        const Gap(5),
                        Text(
                          userData["Username"],
                          style: const TextStyle(
                              color: Color(
                                0xFF697C37,
                              ),
                              fontFamily: 'Rowdies',
                              fontSize: 24),
                        ),
                        const Gap(50),
                        IconButton(
                          onPressed: () => editUserName("Username"),
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xFFFE9801),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFB0AA86),
                    ),
                    const Gap(12),
                    Container(
                      width: 324,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF9F1),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
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
                        width: 324,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9F1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Row(
                          children: [
                            const Gap(6),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.privacy_tip_outlined,
                                color: Color(0xFFFE9801),
                              ),
                            ),
                            const Text(
                              "Private & Policy",
                              style: TextStyle(
                                fontFamily: 'Rowdies',
                                fontSize: 16,
                                color: Color(0xFF697C37),
                              ),
                            )
                          ],
                        )),
                    const Gap(12),
                    Container(
                      width: 324,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF9F1),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          const Gap(6),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.phone_outlined,
                              color: Color(0xFFFE9801),
                            ),
                          ),
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
                    const Gap(12),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AboutUs()),
                        );
                      },
                      child: Container(
                        width: 324,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9F1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
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
                        width: 324,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFF9F1),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
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
                      width: 324,
                      height: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFF9F1),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Row(
                        children: [
                          const Gap(12),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
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
