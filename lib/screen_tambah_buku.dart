// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mob2022/screen_kamera.dart';

class ScreenTambahBuku extends StatefulWidget {
  const ScreenTambahBuku({Key? key}) : super(key: key);

  @override
  State<ScreenTambahBuku> createState() => _ScreenTambahBukuState();
}

class _ScreenTambahBukuState extends State<ScreenTambahBuku> {
  var img_buku = '';
  var judul_buku = '';
  var stok = 0;
  var harga = 0;
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
                _buildForms(),
                SizedBox(
                  height: 30,
                ),
                _buildBtnSave(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBtnSave() {
    return Container(
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
        onPressed: () async {
          var collection = FirebaseFirestore.instance.collection('buku');
          var res = await collection.add({
            'judul': judul_buku,
            'stok': stok,
            'harga': harga,
          });

          print('simpan firestore');
          print(res);
          Navigator.pop(context);
        },
        child: Text('Simpan'),
      ),
    );
  }

  Container _buildForms() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: [
            _buildImageBook(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Judul Buku',
                ),
                textAlign: TextAlign.center,
                onChanged: (v) {
                  judul_buku = v;
                },
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Stok Sewa',
              ),
              onChanged: (v) {
                stok = int.tryParse(v) ?? 0;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Harga Sewa',
              ),
              onChanged: (v) {
                harga = int.tryParse(v) ?? 0;
              },
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildImageBook() {
    return InkWell(
      onTap: () async {
        var _img =
            await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return ScreenKamera();
        }));
        //jika screen kamera me-return sesuatu
        if (_img != null) {
          //jika screen kamera me-return string, maka itu adalah gambar hasil tangkap kamera
          if (_img is String) {
            setState(() {
              img_buku = _img;
            });
          }
        }
      },
      child: Container(
        width: 200,
        height: 150,
        padding: EdgeInsets.all(8),
        child: img_buku.isEmpty
            ? Image.asset('assets/imgs/blank.png')
            : Image.file(File(img_buku)),
      ),
    );
  }
}
