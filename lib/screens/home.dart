import 'dart:io';

import 'package:flutter/material.dart';
import 'package:googlemap/screens/google_map.dart';
import 'package:googlemap/screens/watermark_image.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;

  Future getImage() async {
    // Pick an image from Gallery
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
    });
  }

  Future getCamera() async {
    // Pick an image from camera
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemp = File(image.path);
    setState(() {
      _image = imageTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(
                    _image!,
                    width: 250,
                    height: 250,
                  )
                : Image.asset(
                    "assets/img.webp",
                    width: 250,
                    height: 250,
                  ),
            ElevatedButton(onPressed: getCamera, child: const Text('camera')),
            ElevatedButton(onPressed: getImage, child: const Text('image')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoogleMapsView()));
                },
                child: const Text('map')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WatermarkImage()));
                },
                child: const Text('watermark'))
          ],
        ),
      ),
    );
  }
}
