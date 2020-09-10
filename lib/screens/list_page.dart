import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transisi_test/components/list_employe.dart';
import 'package:transisi_test/providers/employe_provider.dart';

import '../screens/detail_page.dart';
import 'add_employe_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool loading = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      setState(() {
        loading = true;
      });
      Provider.of<EmployeProvider>(context, listen: false)
          .getEmploye()
          .then((value) {
        setState(() {
          loading = false;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final employe = Provider.of<EmployeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Employes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddEmployePage())),
        child: Icon(Icons.add),
      ),
      body: WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  Container(
                    child: employe.addStatus
                        ? ListEmploye(
                            // ditambah ini karena data yang di post hanya datanya tidak dapat di get
                            name:
                                "${employe.addData.firstName + ' ' + employe.addData.firstName}",
                            email: employe.addData.email,
                            avatar: employe.addData.avatar,
                          )
                        : Container(),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: employe.items.length,
                    itemBuilder: (ctx, i) => ListEmploye(
                      name:
                          "${employe.items[i].firstName + " " + employe.items[i].lastName}",
                      email: employe.items[i].email,
                      avatar: employe.items[i].avatar,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
