import 'package:find_me/view/chatbot.dart';
import 'package:find_me/view/widgets/Category.dart';
import 'package:find_me/view/widgets/appbarwideget.dart';
import 'package:find_me/view/widgets/drawerwidget.dart';
import 'package:find_me/view/search.dart';
import 'package:find_me/view/widgets/searchfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  /*int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }*/
  /*List<String> locations = [
    'Ariana',
    'Ben Arous',
    'Bizerte',
    'Béja',
    'Gabès',
    'Gafsa',
    'Jendouba',
    ' Kairouan',
    'Kasserine',
    'Kébili',
    'LA Manouba',
    'Le Kef',
    'Mahdia',
    'Monastir',
    'Médenine',
    'Nabeul',
    ' Sfax',
    'Sidi Bouzid',
    'Siliana',
    'Sousse',
    'Tataouine',
    'Tozeur',
    'Tunis',
    'Zaghouane',
  ];*/

  final List<Category> categories = [
    Category('Electronics', ['Phone', 'Laptop', 'Tablet']),
    Category('Clothing', ['Shirts', 'Pants', 'Dresses']),
    Category('Books', ['Fiction', 'Non-Fiction']),
    Category('Cosmetics', ['Facial', 'Body', 'Hair']),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E1),
      drawer: const DrawerWidget(),
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Welcome to this app',
                style: TextStyle(
                  color: Color(0xFF965D1A),
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'What are you searching for ?',
                style: TextStyle(
                  color: Color(0xFF1E1E1E),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                  letterSpacing: -0.18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SearchFieldWidget(),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: CupertinoButton(
                  color: const Color(0xFFDF9A4F),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const SearchPage())));
                  },
                  child: const Text(
                    "Search",
                    style: TextStyle(
                      color: Color(0xFF965D1A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: CupertinoButton(
                  color: const Color(0xFFDF9A4F),
                  onPressed: () {},
                  child: const Text(
                    "Scan Barcode",
                    style: TextStyle(
                      color: Color(0xFF965D1A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "assets/images/mainscreenimage.png",
                //height: 160,
                width: MediaQuery.of(context).size.width * 0.5,
                //  height: MediaQuery.of(context).size.height * 0.4,*/
              ),
              const SizedBox(
                height: 20,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Start your experience  \nwith',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' chatbot.',
                      style: TextStyle(
                        color: Color(0xFFEFBC73),
                        fontSize: 19,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Search requieres use of chat.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF2E2E2E),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                height: 45,
                child: CupertinoButton(
                  color: const Color(0xFFDF9A4F),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: ((context) => const ChatbotPage())));
                  },
                  child: const Text(
                    "Start",
                    style: TextStyle(
                      color: Color(0xFF965D1A),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
