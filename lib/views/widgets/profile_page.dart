import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
                width: 200,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "D.O.B",
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "E-mail",
              style: TextStyle(fontSize: 23),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "Phone No.",
              style: TextStyle(fontSize: 23),
            ),SizedBox(height: 40,),
            Center(child: ElevatedButton(onPressed: null, child: Text("Save")))
          ],
        ),
      ),
    ));
  }
}
