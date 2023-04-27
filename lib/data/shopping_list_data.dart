import 'package:shop_app/models/shopping_list_model.dart';
import 'package:flutter/material.dart';


const shoppingListData = {
  Categories.vegetables: ShoppingListModel(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: ShoppingListModel(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: ShoppingListModel(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: ShoppingListModel(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: ShoppingListModel(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: ShoppingListModel(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: ShoppingListModel(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: ShoppingListModel(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: ShoppingListModel(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: ShoppingListModel(
    'Other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};