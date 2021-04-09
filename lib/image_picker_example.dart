import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
enum Source{Camera,Gallery}

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File _image;
  final picker = ImagePicker();

  Future getImage(Source source) async {
    var pickedFile;
    print("szd");
    if(source == Source.Camera)
      pickedFile= await picker.getImage(source: ImageSource.camera);
    else
      pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Text('No image selected.') : Image.file(_image,height: 200,width: 200,),

            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: ElevatedButton(
                child: Text("GetImage"),
                onPressed: (){
                  getImage(Source.Camera) ;
                },
              ),
            ),
            ElevatedButton(
              child: Text("GalleryImage"),
              onPressed: (){
                getImage(Source.Gallery) ;
              },
            ),
          ],
        ),
      ),
    );
  }
}
