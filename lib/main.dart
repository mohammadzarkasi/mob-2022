// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mob2022/screen_confirm.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenSignin(),
    );
  }
}

class ScreenSignin extends StatefulWidget {
  ScreenSignin({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenSignin> createState() => _ScreenSigninState();
}

class _ScreenSigninState extends State<ScreenSignin> {
  String username = 'agus', password = '123456';

  var ctrlUsername = TextEditingController();

  var ctrlPassword = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(229, 229, 229, 1),
          ),
          width: double.infinity,
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/imgs/icon.png'),
                Text('Agristore'),
                SizedBox(
                  height: 80,
                ),
                _buildFormLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormLogin() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username'),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: ctrlUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                // focusColor: Color.fromRGBO(206, 255, 188, 1),
                // hoverColor: Color.fromRGBO(206, 255, 188, 1),
                fillColor: Color.fromRGBO(206, 255, 188, 1),
                filled: true,
                prefixIcon: Image.asset(
                  'assets/imgs/profil.png',
                  height: 12,
                ),
              ),
              validator: (val) {
                if (val == null) {
                  return 'tidak boleh kosong';
                }
                if (val.length < 3) {
                  return 'Minimal 3 karakter';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text('Password'),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: ctrlPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                fillColor: Color.fromRGBO(206, 255, 188, 1),
                filled: true,
              ),
              obscureText: true,
              validator: (val) {
                if (val == null) {
                  return 'password harus diisi';
                }
                if (val.length < 6) {
                  return 'password minimal 6 karakter';
                }
                return null;
              },
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 25),
                  ),
                ),
                onPressed: () {
                  if (formkey.currentState != null) {
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Berhasil login')));
                    } else {}
                  }
                },
                child: Text(
                  'LOGIN',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
