import 'package:flutter/material.dart';
import 'package:shop_app/screens/new_item_screen.dart';
import 'package:shop_app/widgets/grocery_item.dart';

import '../data/grocery_item_data.dart';
import '../models/grocery_list_model.dart';

class ShopFirstScreen extends StatefulWidget {
  const ShopFirstScreen({super.key});

  @override
  State<ShopFirstScreen> createState() => _ShopFirstScreenState();
}

class _ShopFirstScreenState extends State<ShopFirstScreen> {
  final List<GroceryItemModel> _list = [];

  void _addItem() async {
    final newItem =  await Navigator.of(context).push<GroceryItemModel>(
        MaterialPageRoute(builder: (ctx) {
          return const NewItemScreen();
        }));
    if (newItem == null) {
      return;
    }
    setState(() {
      _list.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Groceries',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ],
      ),
      body: GroceryItem(addGroceryItems: _list,),
    );
  }
}
