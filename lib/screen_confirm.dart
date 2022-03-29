import 'package:flutter/material.dart';

class ScreenConfirmation extends StatelessWidget {
  String username, password;
  ScreenConfirmation({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('ini adalah halaman konfirmasi'),
            Text(username),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.of(context).pop('sukses');
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
