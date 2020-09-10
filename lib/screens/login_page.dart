import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transisi_test/providers/employe_provider.dart';
import 'package:transisi_test/screens/list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    email.text = "eve.holt@reqres.in";
    password.text = "cityslicka";

    final login = Provider.of<EmployeProvider>(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Image(
              image: NetworkImage(
                  "http://dev.transisi.id/transisi/assets/img/transisi-logo.png"),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Input email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        icon: Icon(Icons.mail_outline),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Input password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        icon: Icon(Icons.security),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: double.infinity,
                      height: 45,
                      child: RaisedButton(
                        onPressed: () {
                          login
                              .login(email.text, password.text)
                              .then((value) => {
                                    if (login.token != null)
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ListPage()))
                                      }
                                  });
                        },
                        color: Colors.indigo,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
