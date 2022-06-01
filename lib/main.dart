// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mob2022/screen_confirm.dart';
import 'package:mob2022/screen_tambah_buku.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  var show_password = false;

  var ctrlUsername = TextEditingController();
  var ctrlPassword = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            // agar keyboard sembunyi
            FocusScope.of(context).unfocus();
          },
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
                  SizedBox(height: 40),
                  Text('Login',
                      style: TextStyle(
                        fontSize: 30,
                      )),
                  SizedBox(height: 15),
                  _buildFormLogin(),
                ],
              ),
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
            _buildUsername(),
            SizedBox(
              height: 10,
            ),
            Text('Password'),
            SizedBox(
              height: 5,
            ),
            _buildPassword(),
            SizedBox(
              height: 40,
            ),
            _buildBtns(),
          ],
        ),
      ),
    );
  }

  TextFormField _buildUsername() {
    return TextFormField(
      controller: ctrlUsername,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
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
    );
  }

  TextFormField _buildPassword() {
    return TextFormField(
      controller: ctrlPassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        fillColor: Color.fromRGBO(206, 255, 188, 1),
        filled: true,
        prefixIcon: Icon(Icons.key),
        suffixIcon: IconButton(
          icon: Icon(Icons.remove_red_eye),
          onPressed: () {
            setState(() {
              show_password = !show_password;
            });
          },
        ),
      ),
      // obscureText: true,
      obscureText: show_password == false,
      validator: (val) {
        if (val == null) {
          return 'password harus diisi';
        }
        if (val.length < 6) {
          return 'password minimal 6 karakter';
        }
        return null;
      },
    );
  }

  Container _buildBtns() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBtnLogin(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red.shade600),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
            ),
            onPressed: () {
              ctrlPassword.clear();
              ctrlUsername.clear();
            },
            child: Text('Reset'),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildBtnLogin() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 25),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: () {
        if (formkey.currentState != null) {
          //trigger semua fungsi validasi pada bidang inputan
          if (formkey.currentState!.validate()) {
            //semua bidang inputan valid
            //show notifikasi di bawah

            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text('Berhasil login')));
            // //lakukan 1 detik kemudian
            // Future.delayed(Duration(seconds: 1), () {
            //   //lakukan navigasi
            //   Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            //     return ScreenTambahBuku();
            //   }));
            // });
            _doLogin();

            //
          }
          //ada bidang inputan yang tidak valid
          else {
            print('ada inputan belum valid');
          }
        }
      },
      child: Text(
        'LOGIN',
      ),
    );
  }

  _doLogin() async {
    try {
      var email = ctrlUsername.text;
      var pass = ctrlPassword.text;
      print('sedang login...');
      var res = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('hasil login:');
      print(res);
    } catch (ex) {
      print('exception login');
      print(ex.runtimeType);
      if (ex is FirebaseAuthException) {
        print(ex);
        print(ex.message);
      }
    }
  }
}
