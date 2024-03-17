import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Catagories/welcome.dart';
import 'package:flutter_application/FavoritePages/savePage.dart';
import 'package:flutter_application/HomePages/home_body.dart';
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
  int _selectedIndex = 2;
  late String _userName = "Your Name";
  late String _userEmail = "Email";
  @override
  void initState() {
    super.initState();
    fetchUserDate();
  }

  Future<void> fetchUserDate() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("Email", isEqualTo: currentUser.email)
          .get();
      if (snapshot.docs.isNotEmpty) {
        final userDate = snapshot.docs.first.data();
        final String username = userDate["Username"];
        final String email = userDate["Email"];
        setState(() {
          _userName = username;
          _userEmail = email;
        });
      }
    }
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screens[index]));
  }

  List<Widget> screens = [
    const SavedPage(),
    const HomeBody(),
    const ProfilePage(),
  ];
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
    screens[_selectedIndex];
    return Scaffold(
      body: SingleChildScrollView(
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
                                backgroundImage:
                                    AssetImage("assets/circleAvatar.jpg"),
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
                  _userName,
                  style: const TextStyle(
                      color: Color(
                        0xFF697C37,
                      ),
                      fontFamily: 'Rowdies',
                      fontSize: 24),
                ),
                const Gap(150),
                IconButton(
                  onPressed: () {},
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
                      _userEmail,
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
            Container(
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
            const Gap(12),
            Container(
              width: 324,
              height: 52,
              decoration: const BoxDecoration(
                color: Color(0xFFFFF9F1),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: const Row(
                children: [
                  Gap(18),
                  Icon(
                    Icons.help_outline,
                    color: Color(0xFFFE9801),
                  ),
                  Gap(12),
                  Text(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffFFF5E5),
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffFE9801),
        unselectedItemColor: const Color(0xffB0AA86),
        selectedIconTheme: const IconThemeData(size: 45, fill: 0.0),
        iconSize: 40,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.bookmark)
                : const Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? const Icon(Icons.home)
                  : const Icon(Icons.home_outlined),
              label: ''),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? const Icon(Icons.person)
                  : const Icon(Icons.person_outline_outlined),
              label: ''),
        ],
      ),
    );
  }
}
