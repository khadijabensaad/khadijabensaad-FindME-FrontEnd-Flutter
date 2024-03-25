import 'package:find_me/view/widgets/Category.dart';
import 'package:flutter/material.dart';

class ProductCategoryPage extends StatelessWidget {
  final List<Category> categories = [
    Category('Electronics', ['Phone', 'Laptop', 'Tablet']),
    Category('Clothing', ['Shirts', 'Pants', 'Dresses']),
    Category('Books', ['Fiction', 'Non-Fiction']),
    Category('Cosmetics', ['Facial', 'Body', 'Hair']),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          //displays the category name as the title and expands to show the list of product tiles when clicked.
          return ExpansionTile(
            title: Text(categories[index].name),
            children: _buildProductTiles(categories[index]),
          );
        },
      ),
    );
  }

//creates a list of ListTile widgets for each product in the category.
  List<Widget> _buildProductTiles(Category category) {
    return category.products
        .map(
          (product) => ListTile(
            title: Text(product),
            onTap: () {
              // Handle product selection
            },
          ),
        )
        .toList();
  }
}
