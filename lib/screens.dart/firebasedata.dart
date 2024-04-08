import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataScreenNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data'),
      ),
      body: Container( height: 500,
        child: Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('data').doc('new').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (snapshot.hasData && snapshot.data!.exists) {
                var document = snapshot.data!;
                String text = document['text'];
                String imageUrl = document['image'];
          
                return
                     Column(mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text(text, style: TextStyle(fontSize: 20),),
                         SizedBox(height: 50,),
                        imageUrl.isNotEmpty
                            ? Image.network(imageUrl)
                            : Container()
                       ],
                     );
               
              } else {
                return Center(child: Text('Document does not exist'));
              }
            },
          ),
        ),
      ),
    );
  }
}
