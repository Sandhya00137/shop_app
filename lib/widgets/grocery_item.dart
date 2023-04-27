import 'package:flutter/material.dart';


import '../models/grocery_list_model.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem({super.key, required this.addGroceryItems});

  final List<GroceryItemModel> addGroceryItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: addGroceryItems.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(addGroceryItems[index].name, style: const TextStyle(
                color: Colors.white
            ),),
            leading: Container(
              height: 24,
              width: 24,
              color: addGroceryItems[index].category.itemColor,
            ),
            trailing: Text(addGroceryItems[index].quantity.toString(), style: const TextStyle(
                color: Colors.white
            ),),
          );
        });
  }
}
