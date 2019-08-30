import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<String> _barcodeString;
  File _image;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });

    Navigator.of(context).pop();
  }

  Future openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('QRCode Reader Example'),
      ),
      body: Stack(
        children: <Widget>[
          buildBody(),
          buildScanButton(),
          buildPictureButton(),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        buildScanResult(),
        Expanded(child: buildPictureResult()),
      ],
    );
  }

  Widget buildScanResult() {
    return Center(
      child: new FutureBuilder<String>(
        future: _barcodeString,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return new Text(snapshot.data != null ? snapshot.data : '');
        },
      ),
    );
  }

  Widget buildPictureResult() {
    return Center(
      child: _image == null ? Text('No image selected.') : Image.file(_image),
    );
  }

  Widget buildScanButton() {
    return Positioned(
      bottom: 10,
      right: 80,
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            _barcodeString = QRCodeReader().setAutoFocusIntervalInMs(200).setForceAutoFocus(true).setTorchEnabled(true).setHandlePermissions(true).setExecuteAfterPermissionGranted(true).scan();
          });
        },
        tooltip: 'Reader the QRCode',
        child: Icon(Icons.scanner),
      ),
    );
  }

  Widget buildPictureButton() {
    return Positioned(
      bottom: 10,
      right: 20,
      child: FloatingActionButton(
        onPressed: _optionsDialogBox,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
