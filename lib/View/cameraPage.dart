import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:ecom_mobile/Model/usuario.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  final Function action;
  const CameraPage({Key? key, required this.cameras, required this.action})
      : super(key: key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;

  Future initCamera(CameraDescription cameraDescription) async {
// create a CameraController
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
// Next, initialize the controller. This returns a Future.
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  void initState() {
    super.initState();
    // initialize the rear camera
    initCamera(widget.cameras![0]);
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  PreviewPage(picture: picture, action: widget.action)));
    } on CameraException catch (e) {
      debugPrint('Erro ao tirar foto: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: _cameraController.value.isInitialized
                ? <Widget>[
                    CameraPreview(
                      _cameraController,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 3.0),
                            child: IconButton(
                              onPressed: takePicture,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: const Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 80,
                              ),
                            ))),
                  ]
                : const <Widget>[
                    Center(child: CircularProgressIndicator()),
                  ]));
  }
}

class PreviewPage extends StatelessWidget {
  // Usuário recebido como parâmetro
  final XFile picture;
  final Function action;
  PreviewPage({super.key, required this.picture, required this.action});

  int index = 0;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CondicaoLogin>(context, listen: false);
    final CollectionReference messagesRef =
        (FirebaseFirestore.instance.collection('messages'));
    return Scaffold(
        body: Stack(children: <Widget>[
      Padding(
          padding: const EdgeInsets.all(0.0),
          child: Image.file(File(picture.path))),
      Align(
          alignment: Alignment.bottomRight,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 50.0),
              child: IconButton(
                onPressed: () => {
                  Navigator.pop(context),
                  Navigator.pop(context),
                  action(messagesRef, user, picture)
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 60,
                ),
              ))),
      Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 50.0),
              child: IconButton(
                onPressed: () => {Navigator.pop(context)},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 60,
                ),
              ))),
    ]));
  }
}
