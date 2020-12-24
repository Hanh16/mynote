import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mynote/model/article_model.dart';
import 'package:mynote/ui/details/NewestDetail.dart';
import 'package:transparent_image/transparent_image.dart';
import 'dart:math' as math;

class NewestItem extends StatelessWidget {
  const NewestItem(this.item, this.index);

  final Article item;

  final int index;

  @override
  Widget build(BuildContext context) {
    var time = ["10:20", "20:50", "05:50", "01:22", "22:22", "00:00"];
    var category = [
      "Confidence",
      "Effort",
      "Awareness",
      "Stability",
      "Wisdom",
      "Free"
    ];
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return NewestDetail(item: this.item, index: this.index);
              },
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Hero(
                    tag: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.memoryNetwork(
                        // here `bytes` is a Uint8List containing the bytes for the in-memory image
                        placeholder: kTransparentImage,
                        image: item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 225,
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       gradient: LinearGradient(
                  //         begin: Alignment.topCenter,
                  //         end: Alignment(0, 2),
                  //         colors: [
                  //           const Color.fromRGBO(69, 77, 102, 0),
                  //           const Color.fromRGBO(69, 77, 102, 0.7)
                  //           // const Color(0xFF309975),
                  //           // const Color(0xFF1A1A1A),
                  //         ],
                  //       )),
                  // ),
                  Positioned(
                      child: Text(
                        time[math.min(index, 5)],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      bottom: 10,
                      right: 10),
                  Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(1.0),
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 3),
                          child: Text(category[math.min(index, 5)],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal)),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(item.title.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black,
                    fontFamily: "SourceSansPro"))
          ],
        ),
      ),
    );
  }
}
