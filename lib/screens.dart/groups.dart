import 'package:fashion_social_media/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GroupsPage extends StatelessWidget {
 final List<Map<String, dynamic>> groups = [
    {'name': 'Running Enthusiasts', 'imageURL': 'https://picsum.photos/200/301'},
    {'name': 'Book Club', 'imageURL': 'https://picsum.photos/200/302'},
    {'name': 'Workplace Team', 'imageURL': 'https://picsum.photos/200/303'},
    {'name': 'Travel Buddies', 'imageURL': 'https://picsum.photos/200/304'},
    {'name': 'Music Lovers', 'imageURL': 'https://picsum.photos/200/305'},
    {'name': 'Foodies Club', 'imageURL': 'https://picsum.photos/200/306'},
    {'name': 'Art & Craft Group', 'imageURL': 'https://picsum.photos/200/307'},
    {'name': 'Outdoor Adventure', 'imageURL': 'https://picsum.photos/200/308'},
    {'name': 'Tech Enthusiasts', 'imageURL': 'https://picsum.photos/200/309'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: primaryColor,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: text2Color, fontSize: 16.sp),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.white,),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Create group button action
              },
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.add, color: primaryColor,),
                  SizedBox(width: 2.w,),
                  Text('Create a group', style: TextStyle(color: primaryColor, fontSize: 16.sp),),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding:  EdgeInsets.only(left: 5.w, bottom: 1.h),
            child: Text('Existing a groups', style: TextStyle(color: text1Color, fontSize: 18.sp),),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: groups.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(groups[index]['imageURL']),
                  ),
                  title: Text(groups[index]['name']),
                  onTap: () {
                    // Navigate to group details or perform other actions
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


