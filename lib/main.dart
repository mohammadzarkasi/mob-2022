import 'package:flutter/material.dart';
import 'package:mob2022/screen_confirm.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenSignup(),
    );
  }
}

class ScreenSignup extends StatelessWidget {
  ScreenSignup({
    Key? key,
  }) : super(key: key);

  String username = 'agus', password = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Ini Judul'),
      ),
      body: Column(
        children: [
          Text('ini text 1'),
          Text('ini text 2'),
          Text('ini text 3'),
          Text('ini text 4'),
          Text('ini text 5'),
          ElevatedButton(
            // anonimous function
            onPressed: () async {
              // print('tombol ditekan');
              var res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext ctx) {
                    return ScreenConfirmation(
                      username: username,
                      password: password,
                    );
                  },
                ),
              );
              print('hasil dari konfirmasi adalah: $res');
            },
            child: Text('Tekan disini'),
            // child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
