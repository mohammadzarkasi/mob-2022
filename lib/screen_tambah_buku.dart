import 'package:flutter/material.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tambah Buku Baru'),
                Text('Pastiin produknya benar'),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/imgs/blank.png',
                          height: 100,
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
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Stok Sewa',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
