import 'package:flutter/material.dart';
import 'package:shop_app/models/grocery_list_model.dart';
import 'package:shop_app/models/shopping_list_model.dart';

import '../data/shopping_list_data.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({Key? key}) : super(key: key);

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = shoppingListData[Categories.vegetables]!;
  final _imageController = TextEditingController();

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_selectedCategory value ');
      Navigator.of(context).pop(GroceryItemModel(
          id: DateTime.now().toString(),
          name: _enteredName,
          category: _selectedCategory,
          quantity: _enteredQuantity));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _imageController.dispose();
    super.dispose();
  }

  void _resetAllFields() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add new Item',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        // instead of textfield
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // instead of textfield()
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text(
                    'name',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'must be 1 to 50 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          label: Text('quantity',
                              style: TextStyle(color: Colors.white))),
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value)! <= 0 ||
                            int.tryParse(value) == null) {
                          return 'must be valid, positive number ';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        items: [
                          for (final item in shoppingListData.entries)
                            DropdownMenuItem(
                                value: item.value,
                                child: Row(children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: item.value.itemColor,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(item.value.itemName),
                                ]))
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        }),
                  ),
                  // ),
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    )),
                    child: _imageController.text.isEmpty
                        ? const Text('Enter a url')
                        : FittedBox(
                            child: Image.network(_imageController.text, fit: BoxFit.cover,),
                          ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(label: Text('Image URl')),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _resetAllFields, child: const Text('Reset')),
                  ElevatedButton(
                      onPressed: _saveItem, child: const Text('Submit')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
