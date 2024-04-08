import 'package:fashion_social_media/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SavedScreen extends StatelessWidget {
 final List<Map<String, dynamic>> savedItems = [
  {
    'type': 'group',
    'name': 'Aarav Sharma',
    'image': 'https://randomuser.me/api/portraits/men/1.jpg',
    'time': '2 hours ago',
    'description': 'Saved group description 1',
  },
  {
    'type': 'post',
    'name': 'Krishna Singh',
    'image': 'https://randomuser.me/api/portraits/men/3.jpg',
    'time': '3 days ago',
    'description': 'Saved post description 1',
  },
  {
    'type': 'group',
    'name': 'Aishwarya Patel',
    'image': 'https://randomuser.me/api/portraits/women/2.jpg',
    'time': '1 day ago',
    'description': 'Saved group description 2',
  },
  {
    'type': 'post',
    'name': 'Priya Gupta',
    'image': 'https://randomuser.me/api/portraits/women/4.jpg',
    'time': '4 days ago',
    'description': 'Saved post description 2',
  },
  {
    'type': 'group',
    'name': 'Arjun Sharma',
    'image': 'https://randomuser.me/api/portraits/men/5.jpg',
    'time': '5 hours ago',
    'description': 'Saved group description 3',
  },
  {
    'type': 'post',
    'name': 'Neha Patel',
    'image': 'https://randomuser.me/api/portraits/women/6.jpg',
    'time': '6 days ago',
    'description': 'Saved post description 3',
  },
  {
    'type': 'group',
    'name': 'Rohan Kumar',
    'image': 'https://randomuser.me/api/portraits/men/7.jpg',
    'time': '7 hours ago',
    'description': 'Saved group description 4',
  },
  {
    'type': 'post',
    'name': 'Ananya Singh',
    'image': 'https://randomuser.me/api/portraits/women/8.jpg',
    'time': '1 week ago',
    'description': 'Saved post description 4',
  },
  {
    'type': 'group',
    'name': 'Vivek Sharma',
    'image': 'https://randomuser.me/api/portraits/men/9.jpg',
    'time': '8 hours ago',
    'description': 'Saved group description 5',
  },
  {
    'type': 'post',
    'name': 'Shreya Gupta',
    'image': 'https://randomuser.me/api/portraits/women/10.jpg',
    'time': '2 weeks ago',
    'description': 'Saved post description 5',
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor,
        title: Text('Saved', style: TextStyle(color: text2Color, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          SizedBox(height: 2.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 3 / 4, // You can adjust this aspect ratio
                ),
                itemCount: savedItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(savedItems[index]['image']),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            savedItems[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5.0),
                          Text(savedItems[index]['description']),
                          SizedBox(height: 5.0),
                          Text(
                            savedItems[index]['time'],
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5.0),
                          Icon(
                            savedItems[index]['type'] == 'group'
                                ? Icons.group
                                : Icons.article_outlined,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

