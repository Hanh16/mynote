import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home/NewestScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: ClampingScrollPhysics(),
        //physics: BouncingScrollPhysics(),
        children: [
          NewestScreen(),
          new Container(
            color: Colors.orange,
          ),
          new Container(
            color: Colors.lightGreen,
          ),
          new Container(
            color: Colors.red,
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavyBar(
      //   selectedIndex: _selectedIndex,
      //   showElevation: true, // use this to remove appBar's elevation
      //   onItemSelected: (index) => setState(() {
      //     _selectedIndex = index;
      //     _pageController.jumpToPage(index);
      //   }),
      //   backgroundColor: Color(0xFF1A2C3C),
      //   items: [
      //     BottomNavyBarItem(
      //       icon: SvgPicture.asset(
      //         'assets/icons/Activity.svg',
      //         color: Colors.white,
      //       ),
      //       title: Text('Newest', style: TextStyle(color: Colors.white)),
      //       activeColor: Colors.green,
      //     ),
      //     BottomNavyBarItem(
      //         icon: SvgPicture.asset('assets/icons/Heart.svg'),
      //         title: Text('Likes', style: TextStyle(color: Colors.white)),
      //         activeColor: Colors.purpleAccent),
      //     BottomNavyBarItem(
      //         icon: SvgPicture.asset('assets/icons/List.svg'),
      //         title: Text('More', style: TextStyle(color: Colors.white)),
      //         activeColor: Colors.blue),
      //   ],
      // ));
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color(0xFF1A2C3C),
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Newest',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Like',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'More',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Color(0xFFEFEEB4),
      //   unselectedItemColor: Color(0xFFFFFFFF),
      //   onTap: _onItemTapped,
      // )
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   // elevation: 20.0,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height: 75,
      //     child: Row(
      //       mainAxisSize: MainAxisSize.max,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         IconButton(
      //           iconSize: 30.0,
      //           padding: EdgeInsets.only(left: 28.0),
      //           icon: Icon(Icons.home),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           iconSize: 30.0,
      //           padding: EdgeInsets.only(right: 28.0),
      //           icon: Icon(Icons.search),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           iconSize: 30.0,
      //           padding: EdgeInsets.only(left: 28.0),
      //           icon: Icon(Icons.notifications),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           iconSize: 30.0,
      //           padding: EdgeInsets.only(right: 28.0),
      //           icon: Icon(Icons.list),
      //           onPressed: () {},
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
