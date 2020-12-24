import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class NewestDetail extends StatefulWidget {
  NewestDetail({Key key, this.image, this.index}) : super(key: key);
  final String image;
  final int index;

  @override
  _NewestDetailState createState() => _NewestDetailState();
}

class _NewestDetailState extends State<NewestDetail> {
  var test = "Momentum is also one of the nature that we can make use of. If we continuously cultivate a wholesome quality of mind, that wholesome quality will become stronger; and it will come more naturally to the mind. It will become a habit of the mind, and it can become a power of the mind. That’s what I call momentum.\n" +
      "\n" +
      "Something that we’re cultivating becomes strong enough to live on its own like the mindfulness remembering to remember on its own, the mindfulness coming naturally and having a momentum that it keeps remembering to be mindful without putting in the effort. And that’s momentum.\n" +
      "\n" +
      "Understand this nature of how momentum can be gained so that we can relaxingly do something repeatedly to make it powerful.\n" +
      "\n" +
      "If we do this for the wholesome qualities of the mind, they become paramis or perfections because we keep fulfilling the wholesome qualities of the mind until they become more powerful, more perfect.\n" +
      "\n" +
      "Momentum is the direct result of the fact that cause and effect is there. If every mind arose and passed away, and left nothing behind, then it would not be possible to grow any quality in the mind.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xFFFFFFFF),
          leading: Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/Arrow-left.svg',
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text("Back", style: TextStyle(color: Colors.black))
            ],
          ),
          leadingWidth: 100,
          title: Text(
            "When the practice is ...",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            PopupMenuButton<int>(
              icon: SvgPicture.asset('assets/icons/popup.svg',
                  width: 20, height: 20, color: Colors.black),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text("Edit"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Delete"),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.5, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Hero(
                  tag: widget.index,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                      // here `bytes` is a Uint8List containing the bytes for the in-memory image
                      placeholder: kTransparentImage,
                      image: widget.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 215,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: Text(
                    "When the practice is correct, faith increases"
                        .toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        fontFamily: "SourceSansPro")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                    "China Retreat 2014 Q&A (2 March 2014 AM; 1:03:44–1:05:30)",
                    style: TextStyle(
                        color: Color(0xFF7D7D7D),
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        fontFamily: "SourceSansPro")),
              ),
              Text(test,
                  style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: "SourceSansPro")),
              SizedBox(
                height: 50,
              )
            ]),
          ),
        ));
  }
}
