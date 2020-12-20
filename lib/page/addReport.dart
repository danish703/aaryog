import 'dart:ffi';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddReport extends StatefulWidget {
  static const routeName = '/add-report';
  @override
  _AddReportState createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  final picker = ImagePicker();
  File _file;
  String _uploadUrl = "not upload yet";
  Future<void> _pickImage(ImageSource source) async {
    final selectedImage = await picker.getImage(source: source);
    setState(() {
      _file = File(selectedImage.path);
    });
  }

  void _clear() {
    setState(() {
      _file = null;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _file.path,
    );
    setState(() {
      _file = cropped ?? _file;
    });
  }

  Future<UploadTask> uploadReport(File _image) async {
    Firebase.initializeApp();
    if (_image == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("No file was selected")));
    }
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('report')
        .child('/${DateTime.now()}' + '.jpg');
    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': _image.path});
    UploadTask uploadTask = ref.putFile(File(_image.path), metadata);
    return Future.value(uploadTask);
  }

  Future<Void> addReportRecord() {
    uploadReport(_file).then((UploadTask task) {
      print("................");
      print(task.snapshot.ref.getDownloadURL());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Report"),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  addReportRecord();
                })
          ],
        ),
        body: Column(
          children: [
            Container(
                child: Center(
              child: _file == null
                  ? Text("No image selected")
                  : Image.file(
                      _file,
                      fit: BoxFit.cover,
                    ),
            )),
            _file == null
                ? Container(
                    child: null,
                  )
                : Row(
                    children: [
                      FlatButton(
                        child: Text("Crop"),
                        onPressed: () {
                          _cropImage();
                        },
                      ),
                      FlatButton(
                        child: Text("Clear"),
                        onPressed: () {
                          _clear();
                        },
                      )
                    ],
                  ),
            Text(_uploadUrl)
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.camera,
                    size: 30,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    _pickImage(ImageSource.camera);
                  },
                ),
              ),
              Expanded(
                child: IconButton(
                  icon: Icon(
                    Icons.image,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                ),
              )
            ],
          ),
        ));
  }
}
