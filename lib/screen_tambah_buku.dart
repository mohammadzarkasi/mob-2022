// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mob2022/screen_kamera.dart';

class ScreenTambahBuku extends StatefulWidget {
  const ScreenTambahBuku({Key? key}) : super(key: key);

  @override
  State<ScreenTambahBuku> createState() => _ScreenTambahBukuState();
}

class _ScreenTambahBukuState extends State<ScreenTambahBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Tambah Buku Baru',
                  style: GoogleFonts.croissantOne(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  // style: TextStyle(
                  //   fontFamily: 'MADE TOMMY',
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.w700,
                  // ),
                ),
                Text(
                  'Pastiin produknya benar',
                  style: TextStyle(
                    fontFamily: 'MADE TOMMY',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return ScreenKamera();
                            }));
                          },
                          child: Container(
                            width: 200,
                            height: 100,
                            padding: EdgeInsets.all(8),
                            child: Image.asset('assets/imgs/blank.png'),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 70),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Judul Buku',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Stok Sewa',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Simpan'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
