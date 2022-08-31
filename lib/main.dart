import 'package:flutter/material.dart';
import 'package:tesst/presentation/pages/add__contact_page.dart';
import 'package:tesst/presentation/pages/add_category_page.dart';
import 'package:tesst/presentation/pages/contacts_page.dart';
import 'package:tesst/presentation/pages/edit_contact_page.dart';
import 'package:tesst/presentation/pages/search_contacts.dart';
import 'package:tesst/presentation/pages/search_contacts_by_category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homePage': (context) => ContactsPage(),
        '/addContactPage': (context) => AddContactPage(),
        '/edit': (context) => EditContactPage(),
        '/addCategoryPage': (context) => AddCategoryPage(),
        '/searchPage': (context) => SearchPage(),
        '/searchContactsByCategory': (context) => SearchContactsByCategory()
      },
      home: ContactsPage(),
    );
  }
}
