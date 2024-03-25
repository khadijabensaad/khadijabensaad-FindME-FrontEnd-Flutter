import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersive); // tna7i barre mta3 wa9t wel buttons mel louta
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      backgroundColor: const Color(0xFFFDF1E1),
      child: ListView(children: <Widget>[
        /* Center(
          child: UserAccountsDrawerHeader(
            accountName: const Text(
              'Khadija Bensaad',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            accountEmail: const Text(
              'khadijabensaad4@gmail.com',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFFDF1E1),
            ),
          ),
        ),*/

        buildHeader(context),

        /*ListTile(
          //tkhalik taamil fazet medilinkl doctors fou9 baathhom
          title: const Text(
            "nom et prenom",
            style: TextStyle(color: Colors.black),
          ),
          subtitle: const Text(
            "voir le profil",
            style: TextStyle(color: Colors.black),
          ),
          leading: InkResponse(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: Color(0xFFDF9A4F),
              radius: 20,
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),*/
        ListTile(
          onTap: () {},
          leading: const Icon(
            CupertinoIcons.person_circle,
            color: Colors.black,
          ),
          title: const Text(
            "My Profile",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            CupertinoIcons.heart,
            color: Colors.black,
          ),
          title: const Text(
            "Favorites",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            CupertinoIcons.tags,
            color: Colors.black,
          ),
          title: const Text(
            "Promotions",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins'),
          ),
        ),
        const SizedBox(
          height: 200,
        ),
        Lottie.asset('assets/images/drawer.json',
            height: 300, reverse: true, repeat: true, fit: BoxFit.cover),
      ]),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: const Color(0xFFFDF1E1),
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(children: [
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile2.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Khadija Bensaad',
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 9,
              ),
              const Text(
                'Khadijabensaad4@gmail.com',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: Colors.black,
                ),
              ),
            ]),
          ),
        ),
      );
}
