import 'dart:io';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> locataionList = ['khzema', 'sahloul', 'Medina'];
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E1),
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: TextField(
                  cursorColor: const Color(0xFFDF9A4F),
                  style: const TextStyle(
                      fontFamily: 'Poppins', fontWeight: FontWeight.w600),
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
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: ((context) => const SearchPage())));
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
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.fromLTRB(50, 5, 1, 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color(0xFFDF9A4F), width: 2),
                        gapPadding: 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color(0xFFDF9A4F), width: 2),
                        gapPadding: 10),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
