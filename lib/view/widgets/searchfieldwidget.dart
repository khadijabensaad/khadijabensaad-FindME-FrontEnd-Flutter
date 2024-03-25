import 'dart:io';
import 'dart:typed_data';
import 'package:find_me/view/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({super.key});

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  Uint8List? _image; //allows to convert to various image format
  File? selectedImage; //Xfile fih file type w size path
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xFFDF9A4F),
      style:
          const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600),
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        // labelText: "Search",
        hintText: "Search product",

        /*  labelStyle: const TextStyle(
                        color: Color(0xFFDF9A4F),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Poppins'),*/
        prefixIcon: IconButton(
          icon: const Icon(
            CupertinoIcons.search,
            size: 25,
            color: Color.fromARGB(255, 97, 84, 72),
          ),
          splashRadius: 10,
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: ((context) => SearchPage())));
          },
        ),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.now_wallpaper,
            size: 23,
            color: Color.fromARGB(255, 97, 84, 72),
          ),
          splashRadius: 10,
          onPressed: () {
            showImagePickerOption(context);
            setState(() {});
          },
        ),
        suffix: IconButton(
          icon: const Icon(
            CupertinoIcons.mic,
            size: 23,
            color: Color.fromARGB(255, 97, 84, 72),
          ),
          splashRadius: 10,
          onPressed: () async {
         /*   PermissionStatus microphoneStatus =
                await Permission.microphone.request();

            if (microphoneStatus == PermissionStatus.granted) {
//Todo : Here what ever your need is to fullfilled.
            }
            if (microphoneStatus == PermissionStatus.denied) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("This permission is recommended."),
                ),
              );
            }
            if (microphoneStatus == PermissionStatus.permanentlyDenied) {
              openAppSettings();
            }*/
            setState(() {});
          },
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.fromLTRB(50, 5, 1, 10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFDF9A4F), width: 2),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Color(0xFFDF9A4F), width: 2),
            gapPadding: 10),
      ),
      onChanged: (value) {
        setState(() {});
      },
      onTap: () {
        setState(() {});
      },
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: const Color(0xFFFDF1E1),
        context: context,
        builder: (builder) {
          return SizedBox(
            height: 90,
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _pickImageFromCamera(); //camera
                        },
                        icon: const Icon(
                          CupertinoIcons.camera_fill,
                          color: Color(0xFF965D1A),
                        ),
                        label: const Text(
                          'Camera',
                          style: TextStyle(
                              color: Color(0xFF965D1A),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          _pickImageFromGallery();
                        },
                        icon: const Icon(
                          CupertinoIcons.photo_fill_on_rectangle_fill,
                          color: Color(0xFF965D1A),
                        ),
                        label: const Text(
                          'Gallery',
                          style: TextStyle(
                              color: Color(0xFF965D1A),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
 /*  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Stack(
                children: [
                  CupertinoSearchTextField(
                      placeholder: "Search products",
                      placeholderStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xFF965D1A), width: 1.4),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      suffixIcon:
                          const Icon(Icons.now_wallpaper, color: Colors.black),
                      suffixInsets: const EdgeInsets.only(right: 8.0),
                      suffixMode: OverlayVisibilityMode.always,
                    ),
                    Positioned(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.mic_fill,
                              color: Colors.black)),
                      left: 230,
                      bottom: -5,
                    )
                  ],
                ),
              ),
            */