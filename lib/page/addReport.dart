import 'dart:io';

import 'package:aarogya/services/firebaseservice.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddReport extends StatefulWidget {
  static const routeName = '/add-report';
  @override
  _AddReportState createState() => _AddReportState();
}

class _AddReportState extends State<AddReport> {
  FireStoreServices _fireStoreServices = new FireStoreServices();
  final picker = ImagePicker();
  File _file;
  String imageDownloadLink;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Report"),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  if (_file == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No file was selected")));
                  } else {
                    String imageName = _fireStoreServices.uploadReport(_file);
                    _fireStoreServices.downloadLink(imageName).then((value) {
                      setState(() {
                        imageDownloadLink = value;
                      });
                    });
                  }
                }),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: "Title",
                    labelStyle: TextStyle(color: Colors.red),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                    )),
              ),
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
              Text(imageDownloadLink == null ? "not set" : imageDownloadLink)
            ],
          ),
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
