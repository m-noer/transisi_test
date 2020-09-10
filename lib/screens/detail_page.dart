import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transisi_test/providers/employe_provider.dart';

import '../components/detail_card.dart';

class DetailEmployePage extends StatelessWidget {
  const DetailEmployePage({
    Key key,
    this.email,
    this.name,
    this.avatar,
  }) : super(key: key);

  final String email;
  final String name;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 39, 20, 20),
            height: 280,
            width: double.infinity,
            color: Colors.indigo,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(150),
                  child: Image(
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      avatar,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          ),
          DetailCard(
            icon: Icon(
              Icons.mail,
              color: Colors.indigo,
              size: 28,
            ),
            header: "E-mail",
            value: email,
          ),
        ],
      ),
    );
  }
}
