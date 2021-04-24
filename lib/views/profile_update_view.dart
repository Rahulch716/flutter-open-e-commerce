import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:opencommerce/models/models.dart';
import 'package:opencommerce/views/profile_page.dart';

// ignore: must_be_immutable
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
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileView(widget.profile)));
                    } catch (e) {
                      final snackBar = SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Sorry! something went wrong'));

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {}
                }
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(3),
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
                TextFormField(
                  initialValue: widget.profile.state,
                  decoration: InputDecoration(
                      labelText: "State",
                      helperText: "Optional",
                      helperStyle: TextStyle(color: Colors.green)),
                  // validator: (value) =>
                  //     value.isEmpty ? "Please enter valid data" : null,
                  onSaved: (value) => widget.profile.state = value,
                ),
                TextFormField(
                  initialValue: widget.profile.city,
                  decoration: InputDecoration(
                      labelText: "City",
                      helperText: "Optional",
                      helperStyle: TextStyle(color: Colors.green)),
                  // validator: (value) =>
                  //     value.isEmpty ? "Please enter valid data" : null,
                  onSaved: (value) => widget.profile.city = value,
                ),
                TextFormField(
                  initialValue: widget.profile.pin,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Pin",
                      helperText: "Optional",
                      helperStyle: TextStyle(color: Colors.green)),
                  // validator: (value) =>
                  //     value.isEmpty ? "Please enter valid data" : null,
                  onSaved: (value) => widget.profile.pin = value,
                ),
                TextFormField(
                  initialValue: widget.profile.landmark,
                  decoration: InputDecoration(
                      labelText: "Landmark",
                      helperText: "Optional",
                      helperStyle: TextStyle(color: Colors.green)),
                  // validator: (value) =>
                  //     value.isEmpty ? "Please enter valid data" : null,
                  onSaved: (value) => widget.profile.landmark = value,
                ),
                TextFormField(
                  initialValue: widget.profile.address,
                  decoration: InputDecoration(
                      labelText: "Address",
                      helperText: "Optional",
                      helperStyle: TextStyle(color: Colors.green)),
                  // validator: (value) =>
                  //     value.isEmpty ? "Please enter valid data" : null,
                  onSaved: (value) => widget.profile.address = value,
                ),
                TextFormField(
                  initialValue: widget.profile.mobile,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "Mobile Number",
                      helperText: "Optional",
                      helperStyle: TextStyle(color: Colors.green)),
                  // validator: (value) =>
                  //     value.isEmpty ? "Please enter your mobile number" : null,
                  onSaved: (value) => widget.profile.mobile = value,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
