import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({Key? key}) : super(key: key);

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  var ctrlUsername = TextEditingController();
  var ctrlPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sign up')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextFormField(
              controller: ctrlUsername,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextFormField(
              controller: ctrlPass,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                do_signup();
              },
              child: Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> do_signup() async {
    try {
      var email = ctrlUsername.text;
      var pass = ctrlPass.text;
      var res = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print('sign up success');
      print(res);
    } catch (ex) {
      print('exception signup');
      print(ex);
    }
  }
}
