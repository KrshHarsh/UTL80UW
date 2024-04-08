import 'package:fashion_social_media/Constants/colors.dart';
import 'package:fashion_social_media/screens.dart/post.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyClosetScreen extends StatefulWidget {
  @override
  State<MyClosetScreen> createState() => _MyClosetScreenState();
}

class _MyClosetScreenState extends State<MyClosetScreen> {

List<Map> myCloset = [
  {'name' : 'Tops',
   'imageUrl' : 'https://images.textilecatalog.in/images/400/catalog/20230505/16832651552095401229-1683182277255043305-WhatsApp%20Image%202023-05-04%20at%2012.00.28%20PM.jpeg'},
  {'name' : 'Shirts',
   'imageUrl' : 'https://thehouseofrare.com/cdn/shop/files/AREO-PASTEL-BLUE3120HERO_1500x.jpg?v=1695366360'},
     {'name' : 'Jeans',
   'imageUrl' : 'https://thehouseofrare.com/cdn/shop/files/DELFT-DUSKY-BLUE1611HERO_6d00745a-d1c3-433c-83e6-f4a296dc5d28_1500x.jpg?v=1696507051'},
     {'name' : 'Shoes',
   'imageUrl' : 'https://assets.myntassets.com/dpr_1.5,q_60,w_400,c_limit,fl_progressive/assets/images/23484790/2023/5/31/14fc49d0-6ce3-4410-9e8c-147f57c539d91685518426707HRXbyHrithikRoshanMenWhiteMeshRunningNon-MarkingShoes1.jpg'},
     {'name' : 'Jwellery',
   'imageUrl' : 'https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/0/b/tr:w-270,/0b3c685AZAIJ00000227_1.jpg?rnd=20200526195200'},
        {'name' : 'Jackets',
   'imageUrl' : 'https://m.media-amazon.com/images/I/71VFs2XrDVL._AC_UY350_.jpg'},

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: primaryColor,
        title: Text('My Closet', style: TextStyle(color: text2Color, fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only( left: 2.w, bottom: 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
               
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/005/419/157/non_2x/female-user-profile-avatar-is-a-woman-a-character-for-a-screen-saver-with-emotions-illustration-on-a-white-isolated-background-vector.jpg'), // Replace with actual image path
                        radius: 40.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Username', // Replace with actual username
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                
                  SizedBox( width: 40.w,
                    child: ElevatedButton(
                      onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PostPage();
                   }));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.add,  color: primaryColor,
                    ),
                          Text('Add New', style: TextStyle(fontSize: 16.sp, color: primaryColor),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 2.w),
               child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 4.w,
                    crossAxisCount: 2,
                  
                    childAspectRatio: 0.8
                  ),
                  itemCount: myCloset.length, // Replace with actual number of items
                  itemBuilder: (BuildContext context, int index) {
                    // Replace with logic to build items
                    return GridTile(
                    child: GestureDetector(
                      onTap: () {
                        // Handle item tap
                      },
                      child: Container(
                       
                        decoration: BoxDecoration(
                           color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            
                            image: NetworkImage(myCloset[index]['imageUrl'], ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            color: Colors.black54,
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              myCloset[index]['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )));
                  },
                ),
             ),
         
          ],
        ),
      ),
    );
  }
}


