import 'package:flutter/material.dart';
import 'package:transisi_test/screens/detail_page.dart';

class ListEmploye extends StatelessWidget {
  const ListEmploye({
    Key key,
    this.name,
    this.email,
    this.avatar,
  }) : super(key: key);

  final String name;
  final String email;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailEmployePage(
            email: email,
            name: name,
            avatar: avatar,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                color: Colors.indigo,
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    "${name.split('')[0]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
