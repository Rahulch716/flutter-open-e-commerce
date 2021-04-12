import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_update_view.dart';

class ProfileView extends StatelessWidget{
  Profile _profile;

  ProfileView(this._profile);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileUpdate(profile:Profile() )));
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Icon(Icons.person),
              ListTile(
                title: Text(
                  _profile.name ?? '',
                ),
                subtitle: Text("Full Name"),
              ),
              ListTile(
                title: Text(
                  _profile.email ?? '',
                ),
                subtitle: Text("Email Id"),
              ),
              ListTile(
                title: Text(
                  _profile.phone ?? '',
                ),
                subtitle: Text("Mobile Number"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}