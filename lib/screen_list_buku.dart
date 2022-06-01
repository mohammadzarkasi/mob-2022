import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mob2022/screen_tambah_buku.dart';

class ScreenListBuku extends StatefulWidget {
  const ScreenListBuku({Key? key}) : super(key: key);

  @override
  State<ScreenListBuku> createState() => _ScreenListBukuState();
}

class _ScreenListBukuState extends State<ScreenListBuku> {
  var list_item = [];
  @override
  void initState() {
    super.initState();
  }

  getData() {
    var colBuku = FirebaseFirestore.instance.collection('buku');
    colBuku.get().then((value) {
      print('value');
      print(value);
      print(value.docs.length);
      setState(() {
        list_item = value.docs.map((e) {
          return {
            'judul': e['judul'],
            'stok': e['stok'],
            'harga': e['harga'],
          };
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Buku')),
      body: Container(
        child: Column(
          children: [
            Text('Daftar buku tersedia:'),
            ElevatedButton(
              onPressed: () {
                getData();
              },
              child: Text('refresh'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ScreenTambahBuku();
                }));
              },
              child: Text('Tambah'),
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (_, int index) {
                var item = list_item[index];
                return ListTile(
                  title: Text(item['judul']),
                  subtitle: Text('${item['harga']}'),
                );
              },
              itemCount: list_item.length,
            )),
          ],
        ),
      ),
    );
  }
}
