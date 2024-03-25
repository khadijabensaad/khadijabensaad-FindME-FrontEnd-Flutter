import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  List<String> locataionList = ['khzema', 'sahloul', 'Medina'];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFDF1E1),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      title: const Text(
        "Home",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xFFFDF1E1),
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: 600,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Filtrer votre recherche",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF965D1A)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Location:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*ListView.builder(
                        itemCount: FiltersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: const Text(
                              "Filtrer votre recherche",
                              style: TextStyle(
                                color: Color(0xFF965D1A),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(
                              FiltersList[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: IconButton(
                              icon: Icon(Icons.add_location_alt),
                              onPressed: () {},
                            ),
                            onTap: () {
                              setState(() {
                                selectedCategory = FiltersList[index];
                              });
                              Navigator.pop(
                                  context); // Close the modal bottom sheet
                            },
                          );
                        },
                      ),*/
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_location_alt,
                                      color: Color(0xFF965D1A),
                                    ),
                                    label: const Text(
                                      'Choose',
                                      style: TextStyle(
                                          color: Color(0xFF965D1A),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                height: 40, // Adjust the height as needed
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: locataionList.length,
                                  shrinkWrap: true,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(width: 8),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0, vertical: 0),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          locataionList[index],
                                          style: const TextStyle(
                                            color: Color(0xFF965D1A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Distance radius:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> locataionList = ['khzema', 'sahloul', 'Medina'];

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFDF1E1),
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),
      title: const Text(
        "Home",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: const Color(0xFFFDF1E1),
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: 600,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filtrer votre recherche",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF965D1A)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Location:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add_location_alt,
                                          color: Color(0xFF965D1A),
                                        ),
                                        label: const Text(
                                          'Choose',
                                          style: TextStyle(
                                              color: Color(0xFF965D1A),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              fontFamily: 'Poppins'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    height: 40, // Adjust the height as needed
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: locataionList.length,
                                      shrinkWrap: true,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(width: 8),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              locataionList[index],
                                              style: const TextStyle(
                                                color: Color(0xFF965D1A),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                          const Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Distance radius:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                /*  SizedBox(height:400,
                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: categories.length,
                                                        itemBuilder: (BuildContext context, int index) {
                                                          return ListTile(
                                                            title: Text(Category(name, products)[index].name),
                                                            onTap: () {
                                                               Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    (Category(name, products): Category(name, products)[index])));
                                                            },
                                                                itemCount:   Category(name, products).length,
                
                                                          );),
                                                                    
                                  ),*/
                              ],
                            ),
                          ),
                        ]),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}*/