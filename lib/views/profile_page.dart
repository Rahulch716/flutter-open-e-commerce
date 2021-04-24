import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_update_view.dart';

// ignore: must_be_immutable
class ProfileView extends StatelessWidget {
  Profile _profile;

  ProfileView(this._profile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'My Profile',
        )),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfileUpdate(profile: Profile())));
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Icon(Icons.person),
              Card(
                color: Colors.yellow[300],
                elevation: 3,
                shadowColor: Colors.pinkAccent,
                child: Column(
                  children: [
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
              SizedBox(
                height: 10,
              ),
              Icon(Icons.house),
              Card(
                color: Colors.yellow[300],
                elevation: 3,
                shadowColor: Colors.pinkAccent,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        _profile.state ?? '',
                      ),
                      subtitle: Text("State"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.city ?? '',
                      ),
                      subtitle: Text("City"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.pin ?? '',
                      ),
                      subtitle: Text("Pin No"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.landmark ?? '',
                      ),
                      subtitle: Text("Landmark"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.address ?? '',
                      ),
                      subtitle: Text("Address"),
                    ),
                    ListTile(
                      title: Text(
                        _profile.mobile ?? '',
                      ),
                      subtitle: Text("Mobile"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
