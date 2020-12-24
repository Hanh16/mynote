import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

import 'item/NewestItem.dart';

class NewestScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    var listImage = [
      "https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png",
      "https://thumbs.dreamstime.com/b/feather-water-bird-surface-free-space-text-42636317.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9eOEbWD1n-w2jOb3DrrMVQqllrf7fjTDcQw&usqp=CAU",
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRrOtoCvZB41tJ-rMtS5mXHP2QSpJmNgVTvPA&usqp=CAU",
      "https://i.pinimg.com/originals/05/78/ae/0578aef779a8e7bf5c34a982d115398e.jpg",
      "https://i.pinimg.com/564x/a6/e9/37/a6e93733c812fa97a82e597d96e44118.jpg",
      "https://i.pinimg.com/originals/b6/0b/8e/b60b8e61220029f03fac60830bdd2c51.jpg",
      "https://i.pinimg.com/236x/9d/e0/ec/9de0ec3e109487f1bccefab300991029--jurnal-a-m.jpg",
      "https://thumbs.dreamstime.com/b/feather-water-bird-surface-free-space-text-42636317.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9eOEbWD1n-w2jOb3DrrMVQqllrf7fjTDcQw&usqp=CAU",
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
      "https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png",
      "https://thumbs.dreamstime.com/b/feather-water-bird-surface-free-space-text-42636317.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9eOEbWD1n-w2jOb3DrrMVQqllrf7fjTDcQw&usqp=CAU",
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRrOtoCvZB41tJ-rMtS5mXHP2QSpJmNgVTvPA&usqp=CAU",
      "https://i.pinimg.com/originals/05/78/ae/0578aef779a8e7bf5c34a982d115398e.jpg",
      "https://i.pinimg.com/564x/a6/e9/37/a6e93733c812fa97a82e597d96e44118.jpg",
      "https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png",
      "https://thumbs.dreamstime.com/b/feather-water-bird-surface-free-space-text-42636317.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9eOEbWD1n-w2jOb3DrrMVQqllrf7fjTDcQw&usqp=CAU",
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRrOtoCvZB41tJ-rMtS5mXHP2QSpJmNgVTvPA&usqp=CAU",
      "https://i.pinimg.com/originals/05/78/ae/0578aef779a8e7bf5c34a982d115398e.jpg",
      "https://i.pinimg.com/564x/a6/e9/37/a6e93733c812fa97a82e597d96e44118.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.6,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Menu.svg',
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text("Menu",
                style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold))
          ],
        ),
        // leading: IconButton(
        // icon: SvgPicture.asset(
        //   'assets/icons/Menu.svg',
        //   color: Colors.black,
        // ),
        //   onPressed: () {},
        // ),
        // actions: [
        //   IconButton(
        //     icon: SvgPicture.asset(
        //       'assets/icons/Icon.svg',
        //       color: Color(0xFF1A1A1A),
        //     ),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: SvgPicture.asset(
        //       'assets/icons/Search.svg',
        //       color: Color(0xFF1A1A1A),
        //     ),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: SvgPicture.asset(
        //       'assets/icons/Bell.svg',
        //       color: Color(0xFF1A1A1A),
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: listImage.length,
        itemBuilder: (BuildContext context, int index) =>
            new Container(child: NewestItem(listImage[index], index)),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.extent(2, (index.isEven) ? 265 : 200),
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 16.0,
        padding: EdgeInsets.symmetric(vertical: 15.5, horizontal: 16),
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
    // body: ListView.builder(
    //     padding: const EdgeInsets.all(8),
    //     itemCount: listImage.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       return Container(child: NewestItem(listImage[index]));
    //     }));
  }

  @override
  bool get wantKeepAlive => true;
}
