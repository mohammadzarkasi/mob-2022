// ignore_for_file: prefer_const_constructors, avoid_print

// import 'package:camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ScreenKamera extends StatefulWidget {
  const ScreenKamera({Key? key}) : super(key: key);

  @override
  State<ScreenKamera> createState() => _ScreenKameraState();
}

class _ScreenKameraState extends State<ScreenKamera> {
  var camera_ready = false;

  // String nama = "";

  // late CameraController _camController;
  CameraController? _camController;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  initCamera() async {
    print('query banyaknya kamera pada hape....');
    var cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      print('jumlah kamera: ${cameras.length}');

      CameraDescription camera = cameras.first;

      _camController = CameraController(
        camera,
        ResolutionPreset.medium,
      );

      _camController?.initialize().then((value) {
        setState(() {
          camera_ready = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _camController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ambil Gambar dari Kamera')),
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
                  onPressed: () async {
                    await _camController?.initialize();
                    var image = await _camController?.takePicture();

                    if (image != null) {
                      print('image disimpan di ${image.path}');
                    }
                  },
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
    if (_camController != null) {
      return CameraPreview(_camController!);
    }
    return Container();
  }
}
