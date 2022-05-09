// ignore_for_file: prefer_const_constructors

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScreenKamera extends StatefulWidget {
  const ScreenKamera({Key? key}) : super(key: key);

  @override
  State<ScreenKamera> createState() => _ScreenKameraState();
}

class _ScreenKameraState extends State<ScreenKamera> {
  var camera_ready = false;
  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() async {
    var cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      print('jumlah kamera: ${cameras.length}');
      var camera = cameras.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ambil Gambar')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              width: double.infinity,
              alignment: Alignment.center,
              child: _buildKamera(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                  onPressed: () {},
                  icon: Icon(Icons.camera),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKamera() {
    if (camera_ready == false) {
      return CircularProgressIndicator();
    }
    return Container();
  }
}
