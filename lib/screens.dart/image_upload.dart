import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_social_media/screens.dart/firebase_data';
import 'package:fashion_social_media/screens.dart/firebasedata.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class ImageUploadScreen extends StatefulWidget {
  bool textWidget;
  bool imageWidget;
  bool buttonWidget;

ImageUploadScreen({
    required this.textWidget,
    required this.imageWidget,
    required this.buttonWidget,
    super.key});

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

XFile? capturedImage; 
Future<void> saveDataToFirestore(String text, File? imageFile) async {
  try {
    // If imageFile is not null, upload image to Firebase Storage
    String imageUrl = '';
    if (imageFile != null) {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');
      firebase_storage.UploadTask uploadTask = ref.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        imageUrl = await ref.getDownloadURL();
      });
    }

    // Save text and imageUrl (if available) to Firestore collection 'data'
    await FirebaseFirestore.instance.collection('data').doc('new').set({
      'text': text,
      'image': imageUrl,
    });
  } catch (e) {
    print('Error saving data: $e');
    // Handle error
  }
}
class _ImageUploadScreenState extends State<ImageUploadScreen> {
  TextEditingController _textEditingController = TextEditingController();
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Container( height: 200,
            child: Center(child: Text('Add at-least a widget to save.', textAlign: TextAlign.center,
             style: TextStyle(fontSize: 20),))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK',      style: TextStyle(fontSize: 20),),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(widget.textWidget)
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter your text here...',
              ),
            ),
            SizedBox(height: 20),
              if(widget.imageWidget)
              capturedImage == null ?
            ElevatedButton(
              onPressed: () async{
                 final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  setState(() {
  capturedImage = pickedImage;
  });
              },
              child: Text('Upload Image', style: TextStyle(fontSize: 20),),
            ) :
            Image.file(File(capturedImage!.path)),
            SizedBox(height: 20),
           
          ],
        ),
      ),
      
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.all(50.0),
        child:   widget.buttonWidget? ElevatedButton(
                onPressed: () async{
                if(widget.textWidget || widget.imageWidget) {
            await      saveDataToFirestore(_textEditingController.text.trim(),capturedImage != null? File(capturedImage!.path) : null );
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return FirebaseDataScreenNew();
}));
                } else {
                  _showAlertDialog();
                }
                },
                child: Text('Save', style: TextStyle(fontSize: 20),),
              ) : null
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
