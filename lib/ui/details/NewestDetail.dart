import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynote/model/article_model.dart';
import 'package:transparent_image/transparent_image.dart';

class NewestDetail extends StatefulWidget {
  NewestDetail({Key key, this.item, this.index}) : super(key: key);
  final Article item;
  final int index;

  @override
  _NewestDetailState createState() => _NewestDetailState();
}

class _NewestDetailState extends State<NewestDetail> {
  var test = "Tại sao bạn  sống? Mục đích của cuộc đời bạn là gì? Điều gì xảy ra sau khi chết? Sớm hay muộn chúng ta cũng phải đối mặt với những câu hỏi này trong cuộc đời. Không phải là những câu hỏi để có thể trả lời dễ dàng… Tôi đố bạn suy nghĩ về cuộc đời mình và tương lai của bạn trong vòng một tuần\n" +
      "\n" +
      "Để giúp bạn suy nghĩ thì bạn sẽ tìm thấy 7 chủ đề trên trang web này. Hãy đầu tư một chút thời gian mỗi ngày trong tuần tiếp theo và tôi hy vọng rằng bạn sẽ có một khám phá quan trọng nhất trong cuộc đời mình, cũng giống như tôi đã khám phá ra\n" +
      "\n" +
      "Bạn không phải đồng ý mọi lúc với những vấn đề được trình bày trên trang web này. Tôi hy vọng bạn đọc trang web một cách cởi mở và đưa ra ý kiến riêng. Nếu bạn không đồng ý, thì cứ đi tiếp và tự mình tìm hiểu sự thật. Điều này có thể rất có giá trị với cuộc đời bạn. Hãy dành một chút thời gian và đầu tư một tuần trong cuộc đời\n" +
      "\n" +
      "Vậy, nếu bạn muốn khám phá ý nghĩa của cuộc sống, xin hãy đọc tiếp…\n";
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
            widget.item.title,
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
                      image: widget.item.image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 215,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: Text(widget.item.title.toUpperCase(),
                    style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        fontFamily: "SourceSansPro")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text("VN (2 December 2020 AM; 1:03:44–1:05:30)",
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
