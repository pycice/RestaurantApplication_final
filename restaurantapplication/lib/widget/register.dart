/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurantapplication/utillity/dialog.dart';
import 'package:restaurantapplication/utillity/my_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final firestoreInstance = FirebaseFirestore.instance;

  void _create() async {
    try {
      await firestore.collection('users').doc('testUser').set(
          {
            'Name': name,
            'User': user,
            'Pass': password,

          });
    } catch (e) {
      print(e);
    }
  }
  double screen;
  String user, password, name;

  @override
  Container buildUser() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16),
        width: screen *0.8,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => user = value.trim(),
          style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            fillColor: Colors.white70,
            filled: true,
            labelText: 'Email',
            prefixIcon: Icon(
              Icons.alternate_email ,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        )
    );
  }


  Container buildPassword() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16),
        width: screen *0.8,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            fillColor: Colors.white70,
            filled: true,
            labelText: 'Password',
            prefixIcon: Icon(
              Icons.lock_outline,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        )
    );
  }

  Container buildName() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white54,
        ),
        margin: EdgeInsets.only(top: 16),
        width: screen *0.8,
        child: TextField(
          onChanged: (value) => name = value.trim(),
          style: TextStyle(color: MyStyle().darkColor),
          decoration: InputDecoration(
            fillColor: Colors.white70,
            filled: true,
            labelText: 'Username',
            prefixIcon: Icon(
              Icons.perm_identity,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: MyStyle().darkColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: MyStyle().lightColor),
            ),
          ),
        )
    );
  }


  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyStyle().prinaryColor,
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(
        backgroundColor: MyStyle().prinaryColor,
        title: Text('Please Register for login'),
      ),
      body: Center(
        child: Column(
          children: [
            buildUser(),
            buildPassword(),
            buildName(),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: MyStyle().darkColor,
      onPressed: () {
        print('name = $name, user = $user, password = $password');
        if ((name?.isEmpty??true)||(user?.isEmpty??true)||(password?.isEmpty??true)){
          print('Have Space');
          normalDialog(context, 'Please enter information');
        } else{
          _create();
          /*registerFirebase();*/
        }
      },
      child: Icon(Icons.add_box_rounded),
    );

  }

/*Future<Null> registerFirebase() async{
    await Firebase.initializeApp().then((value) async{
      print('######## information to database ########');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user, password: password)
          .then((value){
            print('Register Success');
      }).catchError((value) {
        normalDialog(context, value.message);
      });
    });
  }*/
}
