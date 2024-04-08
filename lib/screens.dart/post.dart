import 'dart:io';

import 'package:fashion_social_media/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String? _imageUrl;
XFile? capturedImage; 
bool isLoading = false;
  Future<void> _uploadData() async {
    setState(() {
      isLoading = true;
    });
    // Upload image to Firebase Storage
    // This is just a placeholder, you need to implement image upload functionality
    String imageUrl = await uploadImageToFirebase(File(capturedImage!.path), capturedImage!.path.toString());

    // Add data to Firestore collection
    await FirebaseFirestore.instance.collection('posts').add({
      'posterName': _nameController.text,
      'description': _descriptionController.text,
      'imageUrl': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
      'time'     : '12 : 00'
    });

    // Clear controllers after posting
    _nameController.clear();
    _descriptionController.clear();
    setState(() {
      _imageUrl = null;
    });
 Navigator.pop(context);
    // Show success message or navigate to another page
  }


Future<String> uploadImageToFirebase(File imageFile, String imageName) async {
  try {
    // Create a reference to the location you want to upload to in Firebase Storage
    final Reference storageReference = FirebaseStorage.instance.ref().child('images/$imageName');

    // Upload the file to Firebase Storage
    final UploadTask uploadTask = storageReference.putFile(imageFile);

    // Await the completion of the upload task and get the download URL
    final TaskSnapshot downloadUrl = await uploadTask.whenComplete(() => null);

    // Get the download URL
    final String imageUrl = await downloadUrl.ref.getDownloadURL();

    return imageUrl;
  } catch (e) {
    // Handle any errors here
    print('Error uploading image to Firebase Storage: $e');
    return '';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('New Post', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (capturedImage != null)
              Image.file(
            File(    capturedImage!.path),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ElevatedButton(
              onPressed: () async{
                final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  setState(() {
  capturedImage = pickedImage;
  });
              },
              child: Text('Choose Image'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: null,
            ),
            SizedBox(height: 20.0),
            isLoading?
            Center(child: CircularProgressIndicator(color: primaryColor,)) :
            ElevatedButton(
              onPressed: _uploadData,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
