import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class DetectMain extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => DetectMain());
  }

  @override
  _DetectMainState createState() => new _DetectMainState();
}

class _DetectMainState extends State<DetectMain> {
  XFile? xFile;
  File? _image;
  double? _imageWidth;
  double? _imageHeight;
  var _recognitions;
  final ImagePicker _picker = ImagePicker();

  loadModel() async {
    Tflite.close();
    try {
      String? res;
      res = await Tflite.loadModel(
        model: "assets/tflite/ssd_mobilenet.tflite",
        labels: "assets/tflite/ssd_mobilenet.txt",
      );
      print(res);
    } on PlatformException {
      print("Failed to load the model");
    }
  }

  // run prediction using TFLite on given image
  Future predict(File image) async {
    var recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );
    setState(() {
      _recognitions = recognitions;
    });
  }

  // send image to predict method selected from gallery or camera
  sendImage(File image) async {
    if (image == null) return;
    await predict(image);

    // get the width and height of selected image
    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          setState(() {
            _imageWidth = info.image.width.toDouble();
            _imageHeight = info.image.height.toDouble();
            _image = image;
          });
        })));
  }

  // select image from gallery
  selectFromGallery() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    if (image == null) return;
    setState(() {});
    sendImage(file);
  }

  // select image from camera
  selectFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);
    File file = File(image!.path);
    if (image == null) return;
    setState(() {});
    sendImage(file);
  }

  @override
  void initState() {
    super.initState();

    loadModel().then((val) {
      setState(() {});
    });
  }

  Widget printValue(rcg) {
    if (rcg == null) {
      return Text('',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700));
    } else if (rcg.isEmpty) {
      return Center(
        child: Text("Could not recognize",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      );
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
        child: Text(
          "Prediction: " + _recognitions[0]['label'].toString().toUpperCase(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  // gets called every time the widget need to re-render or build
  @override
  Widget build(BuildContext context) {
    // get the width and height of current screen the app is running on
    Size size = MediaQuery.of(context).size;

    // initialize two variables that will represent final width and height of the segmentation
    // and image preview on screen
    double finalW;
    double finalH;

    // when the app is first launch usually image width and height will be null
    // therefore for default value screen width and height is given
    if (_imageWidth == null && _imageHeight == null) {
      finalW = size.width;
      finalH = size.height;
    } else {
      // ratio width and ratio height will given ratio to
//      // scale up or down the preview image
      double ratioW = size.width / _imageWidth!;
      double ratioH = size.height / _imageHeight!;

      // final width and height after the ratio scaling is applied
      finalW = _imageWidth! * ratioW * .75;
      finalH = _imageHeight! * ratioH * .40;
    }

//    List<Widget> stackChildren = [];

    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          child: printValue(_recognitions),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: _image == null
              ? Center(
                  child: Text("Select image from camera or gallery"),
                )
              : Center(
                  child: Image.file(_image!,
                      fit: BoxFit.fill, width: finalW, height: finalH)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Container(
                height: 50,
                width: 150,
                color: Colors.redAccent,
                child: FlatButton.icon(
                  onPressed: selectFromCamera,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                  color: Colors.deepPurple,
                  label: Text(
                    "Camera",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              ),
            ),
            Container(
              height: 50,
              width: 150,
              color: Colors.tealAccent,
              child: FlatButton.icon(
                onPressed: selectFromGallery,
                icon: Icon(
                  Icons.file_upload,
                  color: Colors.white,
                  size: 30,
                ),
                color: Colors.blueAccent,
                label: Text(
                  "Gallery",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            ),
          ],
        ),
      ],
    ));
  }
}