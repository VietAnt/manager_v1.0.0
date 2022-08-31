import 'package:flutter/material.dart';
import 'package:tesst/data/category_operations.dart';
import 'package:tesst/data/contact_operations.dart';
import 'package:tesst/models/category.dart';
import 'package:tesst/models/contact.dart';
import 'package:tesst/presentation/widgets/categories_dropdown.dart';

class AddContactPage extends StatefulWidget {
  AddContactPage({Key? key}) : super(key: key);

  @override
  _AddContactPageState createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  ContactOperations contactOperations = ContactOperations();
  CategoryOperations categoryOperations = CategoryOperations();
  late Category _selectedCategory;

  callback(selectedCategory) {
    setState(() {
      _selectedCategory = selectedCategory;
      print(_selectedCategory.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _surnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Surname'),
              ),
            ),
            FutureBuilder<List<Category>>(
              future: categoryOperations.getAllCategories(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? CategoriesDropDown(snapshot.data, callback)
                    : Text('No categories');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final contact = Contact(
              name: _nameController.text,
              surname: _surnameController.text,
              category: _selectedCategory.id);
          contactOperations.createContact(contact);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
