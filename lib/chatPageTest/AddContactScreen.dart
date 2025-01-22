import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class AddContactScreen extends StatefulWidget {
  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  List<Contact> _contacts = [];
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  // Request permission to access contacts
  Future<void> _requestPermission() async {
    PermissionStatus permission = await Permission.contacts.request();
    if (permission.isGranted) {
      _getContacts();
    } else {
      // Show a dialog or snackbar asking for permission
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Permission to access contacts is required"),
      ));
    }
  }

  // Fetch the contacts from the device
  Future<void> _getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
    });
  }

  // Function to add a contact to the app
  void _addContact() {
    String phoneNumber = _phoneController.text.trim();
    if (phoneNumber.isNotEmpty) {
      // For example, add the contact to Firebase or any other action
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Contact added with phone number: $phoneNumber"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Show list of contacts
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  var contact = _contacts[index];
                  return ListTile(
                    title: Text(contact.displayName ?? 'No Name'),
                    subtitle: Text(contact.phones?.first.value ?? 'No Phone'),
                    onTap: () {
                      // Do something when contact is tapped (e.g., start chat)
                    },
                  );
                },
              ),
            ),
            // Input for adding a new phone number
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Enter Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addContact,
              child: Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
