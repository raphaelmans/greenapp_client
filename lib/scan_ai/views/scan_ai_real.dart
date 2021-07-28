import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/community/community.dart';
import 'package:greenapp/constants.dart';
import 'package:greenapp/scan_ai/scan_ai.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:waste_material_repository/waste_material_repository.dart';

class ScanAIReal extends StatelessWidget {
  const ScanAIReal({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const ScanAIReal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: View()),
    );
  }
}

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Color(0xff37474F),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchBar(),
          ),
        ),
        Expanded(child: DetectMain()),
        Container(
          color: Color(0xff37474F),
          height: 120,
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scan your trash',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Scan the item in a bright area',
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: TextField(
        decoration: InputDecoration(
            focusColor: Theme.of(context).primaryColor,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Search'),
        onChanged: (value) {
          setState(() {
            searchValue = value;
          });
        },
        onSubmitted: (value) {
          if (value.contains('bottle')) {
            Navigator.of(context).push(DisposeMe.route());
          }
        },
      ),
    );
  }
}

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
  var _recognitions = null;
  String? _objectDetected;
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
    final recognitions = await Tflite.runModelOnImage(
        path: image.path, // required
        imageMean: 0.0, // defaults to 117.0
        imageStd: 255.0, // defaults to 1.0
        numResults: 2, // defaults to 5
        threshold: 0.2, // defaults to 0.1
        asynch: true // defaults to true
        );

    if (recognitions != null) {
      String object =
          Map<String, dynamic>.from(recognitions[0])['label'].split(' ')[1];

      if (object == 'Plastic') {
        object = 'Plastic Bottles';
      }

      setState(() {
        _recognitions = recognitions;
        _objectDetected = object;
      });

      final snapshot = await FirebaseFirestore.instance
          .collection('materials')
          .where('name', isEqualTo: object)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final name = snapshot.docs.single.data()['name'];
        final about = snapshot.docs.single.data()['about'];
        String? imageLink = snapshot.docs.single.data()['imageLink'];
        String? disposal = snapshot.docs.single.data()['disposal'];

        WasteMaterial material =
            WasteMaterial(about, name, imageLink, disposal);

        context.read<MaterialCubit>().selectMaterial(material);
      }
    }
  }

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
    print(file);
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

    String materialDetected = _recognitions[0]['label'].toString();
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Center(
        child: Text(
          "Prediction: " +
              (materialDetected.contains('Plastic')
                  ? 'Plastic Bottle'
                  : materialDetected),
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
      finalW = _imageWidth! * ratioW * .65;
      finalH = _imageHeight! * ratioH * .30;
    }

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
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
        _recognitions != null
            ? TextButton(
                onPressed: () => Navigator.of(context).push(DisposeMe.route()),
                child: Text('Dispose me',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)))
            : SizedBox(),
        _recognitions != null &&
                _objectDetected != null &&
                _objectDetected == 'Plastic Bottles'
            ? TextButton(
                onPressed: () => Navigator.of(context).push(RecycleIt.route()),
                child: Text('Recycle me',
                    style: TextStyle(
                        color: Color(0xff40B861),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0)),
                style: TextButton.styleFrom(backgroundColor: Colors.white),
              )
            : SizedBox(),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                ),
                child: IconButton(
                  onPressed: selectFromCamera,
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 30,
                  ),
                  color: Colors.deepPurple,
                ),
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              child: IconButton(
                onPressed: selectFromGallery,
                icon: Icon(
                  Icons.file_upload,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
            ),
          ],
        ),
      ],
    );
  }
}
