// import 'package:flutter/material.dart';

// class homeScreen extends StatefulWidget {
//   @override
//   State<homeScreen> createState() {
//     return _homeScreenState();
//   }
// }

// class _homeScreenState extends State<homeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     int selectIdx = 0; 
//     PageController pageController = PageController() ;
//     void onTap(int pageValue){
      
//       setState(() {
//         selectIdx=  pageValue ;
//       });
//       pageController.jumpToPage(pageValue); 
//     }
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.black87,
//         selectedFontSize: 14,
//         selectedIconTheme: const IconThemeData(color: Colors.black87),
//         unselectedFontSize: 12.0,
//          selectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.white),
        
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/image/home.png',
//               color: Colors.white,
//               height: 25,
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 'assets/image/search.png',
//                 height: 25,
//                 //color: Colors.white,
//               ),
//               label: 'search')
//         ],

//        onTap: onTap ,
//       ),

//       body: ,
//     );
//   }
// }
