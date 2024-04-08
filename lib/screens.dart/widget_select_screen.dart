import 'package:fashion_social_media/screens.dart/image_upload.dart';
import 'package:flutter/material.dart';



class WidgetSelectionScreen extends StatefulWidget {
@override
_WidgetSelectionScreenState createState() => _WidgetSelectionScreenState();
}

class _WidgetSelectionScreenState extends State<WidgetSelectionScreen> {
bool isTextSelected = false;
bool isImageSelected = false;
bool isButtonSelected = false;

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Widget Selection'),
),
body: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
widgetSelectionTile(
'Text Widget',
isTextSelected,
onChanged: (value) {
setState(() {
isTextSelected = value;
});
},
),
widgetSelectionTile(
'Image Widget',
isImageSelected,
onChanged: (value) {
setState(() {
isImageSelected = value;
});
},
),
widgetSelectionTile(
'Button Widget',
isButtonSelected,
onChanged: (value) {
setState(() {
isButtonSelected = value;
});
},
),
],
),
bottomNavigationBar: BottomAppBar(
child: Container(
height: 50.0,
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
ElevatedButton(
onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return ImageUploadScreen(textWidget: isTextSelected, imageWidget: isImageSelected, buttonWidget: isButtonSelected,);
}));
},
child: Text('Import Widgets', style: TextStyle(fontSize: 20),),
),
],
),
),
),
);
}

widgetSelectionTile(String title, bool isSelected,
{ValueChanged<bool>? onChanged}) {
return Padding(
padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
child: ListTile(
title: Text(title),
leading: CircleAvatar(
backgroundColor: isSelected ? Colors.green : Colors.transparent,
child: isSelected
? Icon(
Icons.check,
color: Colors.white,
)
: Container(decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(color: Colors.green,

)),),
),
onTap: () {
onChanged?.call(!isSelected);
},
),
);
}
}
