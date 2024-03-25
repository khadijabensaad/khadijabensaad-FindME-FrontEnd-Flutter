import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
  List<String> categories = ['Category A', 'Category B', 'Category C'];

  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Location'),
            onTap: () {
              // Handle location tap
              // For example, show location picker
              print('Location tapped');
            },
          ),
          ListTile(
            title: Text('Category'),
            onTap: () {
              // Handle category tap
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(categories[index]),
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index];
                          });
                          Navigator.pop(
                              context); // Close the modal bottom sheet
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          if (selectedCategory.isNotEmpty) ...[
            const Divider(),
            ListTile(
              title: Text('Subcategories of $selectedCategory'),
              // Here you can show subcategories of the selected category
              // or any additional filter options related to the selected category
            ),
          ],
        ],
      ),
    );
  }
}
