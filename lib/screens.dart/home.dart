import 'package:fashion_social_media/screens.dart/widget_select_screen.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isWidgetAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text(
'No Widget Added',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WidgetSelectionScreen();
                }));
                },
                child: Text('Add Widget', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
