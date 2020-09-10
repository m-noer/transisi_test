import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transisi_test/providers/employe_provider.dart';
import 'package:transisi_test/screens/login_page.dart';

import 'screens/list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmployeProvider>(
          create: (_) => EmployeProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Transisi Test',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
      ),
    );
  }
}
