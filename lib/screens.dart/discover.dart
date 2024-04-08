import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_social_media/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String _selectedFilter = 'Filter'; // Initial filter selection
  List<Map<String, dynamic>> clothingPosts = [
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/1.jpg',
    'imageUrl': 'https://picsum.photos/300/400',
    'posterName': 'Aarav Sharma',
    'description': 'Traditional attire for the festive season.',
    'time': '2 hours ago',
    'likes': 10,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/women/2.jpg',
    'imageUrl': 'https://picsum.photos/300/401',
    'posterName': 'Aishwarya Patel',
    'description': 'Casual outfit for a day out with friends.',
    'time': '1 day ago',
    'likes': 20,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/3.jpg',
    'imageUrl': 'https://picsum.photos/300/402',
    'posterName': 'Krishna Singh',
    'description': 'Stylish ethnic wear for weddings.',
    'time': '3 days ago',
    'likes': 15,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/women/4.jpg',
    'imageUrl': 'https://picsum.photos/300/403',
    'posterName': 'Priya Gupta',
    'description': 'Trendy western wear for the summer.',
    'time': '4 days ago',
    'likes': 12,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/5.jpg',
    'imageUrl': 'https://picsum.photos/300/404',
    'posterName': 'Arjun Sharma',
    'description': 'Sporty attire for outdoor activities.',
    'time': '5 days ago',
    'likes': 18,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/women/6.jpg',
    'imageUrl': 'https://picsum.photos/300/405',
    'posterName': 'Neha Patel',
    'description': 'Chic evening wear for parties.',
    'time': '6 days ago',
    'likes': 25,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/7.jpg',
    'imageUrl': 'https://picsum.photos/300/406',
    'posterName': 'Rohan Kumar',
    'description': 'Formal attire for office meetings.',
    'time': '1 week ago',
    'likes': 30,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/women/8.jpg',
    'imageUrl': 'https://picsum.photos/300/407',
    'posterName': 'Ananya Singh',
    'description': 'Vintage clothing for a retro look.',
    'time': '1 week ago',
    'likes': 22,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/men/9.jpg',
    'imageUrl': 'https://picsum.photos/300/408',
    'posterName': 'Vivek Sharma',
    'description': 'Comfortable loungewear for lazy Sundays.',
    'time': '2 weeks ago',
    'likes': 35,
  },
  {
    'profileImageUrl': 'https://randomuser.me/api/portraits/women/10.jpg',
    'imageUrl': 'https://picsum.photos/300/409',
    'posterName': 'Shreya Gupta',
    'description': 'Elegant sarees for special occasions.',
    'time': '2 weeks ago',
    'likes': 28,
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text('Discover', style: TextStyle(color: text2Color, fontWeight: FontWeight.bold),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              
              child: Text('Fasion', style: TextStyle(color: Colors.white, fontSize: 20.sp),),
              decoration: BoxDecoration(
                color: primaryColor,
              ),
            ),
            ListTile(
              title: Text('Suggested', ),
              onTap: () {
                       Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Followers'),
              onTap: () {
              Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Following'),
              onTap: () {
                     Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: DropdownButtonFormField(
              value: _selectedFilter,
              items: ['Filter', 'Color', 'Catergory', 'Size']
                  .map((filter) => DropdownMenuItem(
                        value: filter,
                        child: Text(filter),
                      ))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedFilter = newValue.toString();
                });
              },
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No posts found.'),
            );
          }
          
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                     var post = snapshot.data!.docs[index];
                    return Card(
                      color: Colors.white,
                      elevation: 3.0,
                      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: NetworkImage(clothingPosts[index]['imageUrl']),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  post['posterName'],
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 18.sp, color: text1Color),
                                ),
                                Spacer(),
                                Text(
                                  post['time'],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                               post['imageUrl'],
                                width: double.infinity,
                                height: 300.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              post['description'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.favorite, color: primaryColor,),
                                  onPressed: () {
                                    // Handle like button tap
                                  },
                                ),
                                Text('${clothingPosts[index]['likes']} Likes'),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.comment, color: primaryColor,),
                                  onPressed: () {
                                    // Handle comment button tap
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}


