import 'package:fashion_social_media/Constants/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  List<Map<String, dynamic>> chats = [
  {
    'name': 'Aarav Sharma',
    'image': 'https://randomuser.me/api/portraits/men/1.jpg',
    'lastMsg': 'Hello, how are you?',
    'time': '10:30 AM',
  },
  {
    'name': 'Aishwarya Patel',
    'image': 'https://randomuser.me/api/portraits/women/2.jpg',
    'lastMsg': 'Can you send me the document?',
    'time': 'Yesterday',
  },
  {
    'name': 'Krishna Singh',
    'image': 'https://randomuser.me/api/portraits/men/3.jpg',
    'lastMsg': 'See you soon!',
    'time': '2 days ago',
  },
  {
    'name': 'Priya Gupta',
    'image': 'https://randomuser.me/api/portraits/women/4.jpg',
    'lastMsg': 'What\'s for dinner?',
    'time': '2 days ago',
  },
  {
    'name': 'Arjun Sharma',
    'image': 'https://randomuser.me/api/portraits/men/5.jpg',
    'lastMsg': 'Happy birthday!',
    'time': '3 days ago',
  },
  {
    'name': 'Neha Patel',
    'image': 'https://randomuser.me/api/portraits/women/6.jpg',
    'lastMsg': 'Let\'s meet tomorrow.',
    'time': '4 days ago',
  },
  {
    'name': 'Rohan Kumar',
    'image': 'https://randomuser.me/api/portraits/men/7.jpg',
    'lastMsg': 'How was your day?',
    'time': '5 days ago',
  },
  {
    'name': 'Ananya Singh',
    'image': 'https://randomuser.me/api/portraits/women/8.jpg',
    'lastMsg': 'I miss you!',
    'time': '1 week ago',
  },
  {
    'name': 'Vivek Sharma',
    'image': 'https://randomuser.me/api/portraits/men/9.jpg',
    'lastMsg': 'Are you free today?',
    'time': '2 weeks ago',
  },
  {
    'name': 'Shreya Gupta',
    'image': 'https://randomuser.me/api/portraits/women/10.jpg',
    'lastMsg': 'What\'s the plan for the weekend?',
    'time': '2 weeks ago',
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Chats', style: TextStyle(color: text2Color, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chats[index]['image']),
            ),
            title: Text(chats[index]['name']),
            subtitle: Text(chats[index]['lastMsg']),
            trailing: Text(chats[index]['time']),
            onTap: () {
              // Open chat screen for the selected user
            },
          );
        },
      ),
    );
  }
}

