import 'package:bytebank_persistencia/dao/contact_dao.dart';
import 'package:bytebank_persistencia/screens/contact_form.dart';
import 'package:flutter/material.dart';

import 'contact.dart';

class ContactsList extends StatelessWidget {
  ContactsList({Key? key}) : super(key: key);
  final List<Contact> contacts = [];
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.green[900],
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: Future.delayed(const Duration(seconds: 1))
            .then((value) => _dao.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.green[800],
                      color: Colors.green[700],
                    ),
                    const Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data as List<Contact>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return _ContactItem(contact);
                },
                itemCount: contacts.length,
              );
          }
          return const Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ContactForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(
            contact.name,
            style: const TextStyle(fontSize: 24.0),
          ),
          subtitle: Text(
            contact.accountNumber.toString(),
            style: const TextStyle(fontSize: 16.0),
          )),
    );
  }
}
