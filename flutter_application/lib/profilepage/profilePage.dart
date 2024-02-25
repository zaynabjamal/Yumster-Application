import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application/Catagories/welcome.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                        child: IconButton(
                          onPressed: _pickImageFromGallery,
                          icon: Icon(Icons.add_a_photo),
                        ),
                        bottom: -10,
                        right: -10,
                      ),
                  ],
                ),
                const Text(
                  "Your Name",
                  style: TextStyle(
                      color: Color(
                        0xFF697C37,
                      ),
                      fontFamily: 'Rowdies',
                      fontSize: 24),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
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
            Container(
              width: 324,
              height: 52,
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F1),
                  borderRadius: BorderRadius.circular(24)),
              child:const Stack(
                children: [
                  Positioned(
                    left: 8, 
                    top: 12, 
                    child: Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Color(0xFFFE9801),
                        ),
                        Text("Email",style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 16,
                          color: Color(0xFF697C37),
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
             Container(
              width: 324,
              height: 52,
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F1),
                  borderRadius: BorderRadius.circular(24)),
              child: Stack(
                children: [
                  Positioned(
                    left: 8, 
                    top: 12, 
                    child: Row(
                      children: [
                       IconButton(onPressed: (){}, icon:const  Icon(
                          Icons.privacy_tip_outlined,
                          color: Color(0xFFFE9801),
                        ),),
                       const Text("Private & Policy",style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 16,
                          color: Color(0xFF697C37),
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
               Container(
              width: 324,
              height: 52,
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F1),
                  borderRadius: BorderRadius.circular(24)),
              child: Stack(
                children: [
                  Positioned(
                    left: 8, 
                    top: 12, 
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          // showBottomSheet(
                          //   context: context,
                          //   builder: (BuildContext context){
                          //     return const SizedBox(
                          //       height: 400,
                          //     );
                          //   }
                          // );
                        }, icon:const Icon(
                          Icons.phone_outlined,
                          color: Color(0xFFFE9801),
                        ),),
                       const Text("Contact Us",style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 16,
                          color: Color(0xFF697C37),
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
               Container(
              width: 324,
              height: 52,
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F1),
                  borderRadius: BorderRadius.circular(24)),
              child: Stack(
                children: [
                  Positioned(
                    left: 8, 
                    top: 12, 
                    child: Row(
                      children: [
                       SvgPicture.asset("assets/svg/aboutUs.svg"),
                       const Text("About Us",style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 16,
                          color: Color(0xFF697C37),
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
               Container(
              width: 324,
              height: 52,
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F1),
                  borderRadius: BorderRadius.circular(24)),
              child:const Stack(
                children: [
                  Positioned(
                    left: 8, 
                    top: 12, 
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Color(0xFFFE9801),
                        ),
                        Text("Help",style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 16,
                          color: Color(0xFF697C37),
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
               Container(
              width: 324,
              height: 52,
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F1),
                  borderRadius: BorderRadius.circular(24)),
              child: Stack(
                children: [
                  Positioned(
                    left: 8, 
                    top: 12, 
                    child: Row(
                      children: [
                       IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context) => Welcome()));
                       }, icon:const Icon( Icons.logout_outlined,
                          color: Color(0xFFFE9801),) ),
                      const  Text("Log Out",style: TextStyle(
                          fontFamily: 'Rowdies',
                          fontSize: 16,
                          color: Color(0xFFFE9801),
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
