import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transisi_test/providers/employe_provider.dart';
import 'package:transisi_test/screens/list_page.dart';

class AddEmployePage extends StatefulWidget {
  const AddEmployePage({Key key}) : super(key: key);

  @override
  _AddEmployePageState createState() => _AddEmployePageState();
}

class _AddEmployePageState extends State<AddEmployePage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final addEmploye = Provider.of<EmployeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employe'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                addEmploye
                    .addEmploye(firstName.text, lastName.text, email.text)
                    .then((_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(),
                    ),
                  );
                });
              }
            },
            child: Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          children: <Widget>[
            TextFormField(
              controller: firstName,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Input First Name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "First Name",
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: lastName,
              decoration: InputDecoration(
                labelText: "Last Name",
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Input E-mail';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "E-mail",
                icon: Icon(Icons.mail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
