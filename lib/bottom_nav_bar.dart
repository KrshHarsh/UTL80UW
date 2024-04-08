
import 'package:fashion_social_media/CustomWidgets/custom_bottom_nav_bar.dart';
import 'package:fashion_social_media/screens.dart/chats.dart';
import 'package:fashion_social_media/screens.dart/discover.dart';
import 'package:fashion_social_media/screens.dart/groups.dart';
import 'package:fashion_social_media/screens.dart/home.dart';
import 'package:fashion_social_media/screens.dart/my_closet.dart';
import 'package:fashion_social_media/screens.dart/saved.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomNavBar extends StatefulWidget {
  

const BottomNavBar({


  super.key});

@override
State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


PersistentTabController _controller = PersistentTabController(initialIndex: 0);

List<Widget> _buildScreens() {
return  [
HomeScreen(),
GroupsPage(),
DiscoverScreen(),
SavedScreen(),
ChatScreen(),
];
}


List<PersistentBottomNavBarItem> _navBarsItems() {
return [
PersistentBottomNavBarItem(
icon: Icon(CupertinoIcons.profile_circled,size: 25.sp,
color: Colors.white, 
), title: 'My Closet'
),
PersistentBottomNavBarItem(
icon: Icon(CupertinoIcons.group,size: 25.sp,
color: Colors.white, 
), title: 'Groups'
),
PersistentBottomNavBarItem(
icon: Icon(Icons.home,size: 25.sp,
color: Colors.white, 
), title: 'Discover'
),
PersistentBottomNavBarItem(
icon: Icon(Icons.favorite,size: 25.sp,
color: Colors.white, 
), title: 'Saved'
),
PersistentBottomNavBarItem(
icon: Icon(CupertinoIcons.chat_bubble,size: 25.sp,
color: Colors.white, 
), title: 'Chat'
),
];
}

@override
Widget build(BuildContext context) {
return PersistentTabView.custom(
navBarHeight: 10.h,
backgroundColor: Colors.white,
context,
controller: _controller,
itemCount: 5, 
screens: _buildScreens(),
confineInSafeArea: true,
handleAndroidBackButtonPress: true,

customWidget: (navBarEssentials) => CustomNavBarWidget( 
items: _navBarsItems(),
selectedIndex: _controller.index,
onItemSelected: (index) {
setState(() {
_controller.index = index; 
});
},
),
);
}
}
