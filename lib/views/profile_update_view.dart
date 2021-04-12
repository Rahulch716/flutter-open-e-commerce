import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_page.dart';


class ProfileUpdate extends StatefulWidget {
  Profile profile = Profile();

  ProfileUpdate({this.profile});

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  /// form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                var form = _formKey.currentState;

                ///
                /// 1. Validate the form data by calling form.validate()
                if (form.validate()) {
                  /// 2. Save the form fields value by calling form.save()
                  form.save();

                  /// 3. Save data to the server/ database by calling service.save()
                  /// get firebase auth uid
                  var user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    try {
                      await FirebaseFirestore.instance
                          .collection("profiles")
                          .doc(user.uid)
                          .set(widget.profile.toMap());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileView(widget.profile)));
                    } catch (e) {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Sorry! something went wrong'));

                      Scaffold.of(context).showSnackBar(snackBar);
                    }
                  } else {}
                }
              },
            )
          ],
        ),
        body:Container(
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: widget.profile.name,
                  decoration: InputDecoration(labelText: "Full Name"),
                  validator: (value) =>
                      value.isEmpty ? "Please enter your name" : null,
                  onSaved: (value) => widget.profile.name = value,
                ),
                TextFormField(
                  initialValue: widget.profile.email,
                  decoration: InputDecoration(labelText: "Email Id"),
                  validator: (value) =>
                      value.isEmpty ? "Please enter your email Id" : null,
                  onSaved: (value) => widget.profile.email = value,
                ),
                TextFormField(
                  initialValue: widget.profile.phone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Mobile Number"),
                  validator: (value) =>
                      value.isEmpty ? "Please enter your mobile number" : null,
                  onSaved: (value) => widget.profile.phone = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
