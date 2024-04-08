import 'package:fashion_social_media/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomNavBarWidget extends StatelessWidget {
final int selectedIndex;
final List<PersistentBottomNavBarItem> items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
final ValueChanged<int> onItemSelected;

CustomNavBarWidget(
{
required   this.selectedIndex,
required this.items,
required this.onItemSelected,});

Widget _buildItem(
PersistentBottomNavBarItem item, bool isSelected) {
return Container( height: isSelected ? 34.sp : null,
alignment: Alignment.center,
decoration:  BoxDecoration(
color:
isSelected?  primaryColor : Colors.transparent
),

child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,

children: <Widget>[
Flexible(
child: IconTheme(
data: IconThemeData(
size: 26.0,
color: isSelected
? (item.activeColorSecondary == null
? item.activeColorPrimary
: item.activeColorSecondary)
: item.inactiveColorPrimary == null
? item.activeColorPrimary
: item.inactiveColorPrimary),
child: item.icon,
),
),
Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Material(
                    type: MaterialType.transparency,
                    child: FittedBox(
                        child: Text(
                        item.title.toString(),
                        style: TextStyle(
                            color: text2Color,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0),
                    )),
                    ),
                )
],
),
);
}

@override
Widget build(BuildContext context) {
return Padding(
padding: EdgeInsets.symmetric(horizontal: 0),
child: Container(
decoration: BoxDecoration(

borderRadius: BorderRadius.circular(0),
gradient: LinearGradient(

begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors: [
primaryColor, primaryColor2
],

),


),
child: SizedBox(
width: double.infinity,
height: 6.0,
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
children: items.map((item) {
int index = items.indexOf(item);
return Flexible(
child: GestureDetector(
onTap: () {
this.onItemSelected(index);
},
child: _buildItem(
item, selectedIndex == index),
),
);
}).toList(),
),
),
),
);
}
}