import 'package:flutter/material.dart';
import 'package:chat_app/models/Contact.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> mockContacts() {
    List<Contact> contacts = [];
    for (var i = 0; i < 15; i++) {
      contacts
          .add(new Contact(name: "Esteban", description: "Me gusta el arte"));
    }
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContactsList(contacts: mockContacts()),
    );
  }
}

class ContactsList extends StatelessWidget {
  const ContactsList({Key key, this.contacts});

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    Widget makerContact({int index}) {
      return ContactTile(contact: contacts[index]);
    }

    Widget makeList() {
      return Container(
        child: ListView.builder(
          itemCount: contacts.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return makerContact(index: index);
          },
        ),
      );
    }

    return Container(
      child: makeList(),
    );
  }
}

class ContactTile extends StatelessWidget {
  const ContactTile({Key key, this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      title: Text(contact.name),
    ));
  }
}
