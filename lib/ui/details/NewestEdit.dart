import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:mynote/ui/home/article_view_model.dart';
import 'dart:developer';
import 'dart:math' as math;

import 'package:stacked/stacked.dart';
import 'package:transparent_image/transparent_image.dart';

class NewestEdit extends StatefulWidget {
  @override
  _NewestEditState createState() => _NewestEditState();
}

var test = "Tại sao bạn  sống? Mục đích của cuộc đời bạn là gì? Điều gì xảy ra sau khi chết? Sớm hay muộn chúng ta cũng phải đối mặt với những câu hỏi này trong cuộc đời. Không phải là những câu hỏi để có thể trả lời dễ dàng… Tôi đố bạn suy nghĩ về cuộc đời mình và tương lai của bạn trong vòng một tuần\n" +
    "\n" +
    "Để giúp bạn suy nghĩ thì bạn sẽ tìm thấy 7 chủ đề trên trang web này. Hãy đầu tư một chút thời gian mỗi ngày trong tuần tiếp theo và tôi hy vọng rằng bạn sẽ có một khám phá quan trọng nhất trong cuộc đời mình, cũng giống như tôi đã khám phá ra\n" +
    "\n" +
    "Bạn không phải đồng ý mọi lúc với những vấn đề được trình bày trên trang web này. Tôi hy vọng bạn đọc trang web một cách cởi mở và đưa ra ý kiến riêng. Nếu bạn không đồng ý, thì cứ đi tiếp và tự mình tìm hiểu sự thật. Điều này có thể rất có giá trị với cuộc đời bạn. Hãy dành một chút thời gian và đầu tư một tuần trong cuộc đời\n" +
    "\n" +
    "Vậy, nếu bạn muốn khám phá ý nghĩa của cuộc sống, xin hãy đọc tiếp…\n";

class _NewestEditState extends State<NewestEdit> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleViewModel>.reactive(
        onModelReady: (model) => {
              model.editingControllerTitle.text =
                  "Những câu nói hay về cuộc sống và ý nghĩa cuộc đời ...",
              model.editingControllerContent.text = test
            },
        builder: (context, model, child) => Scaffold(
              resizeToAvoidBottomPadding: false,
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
                  "Edit",
                  style: TextStyle(color: Colors.black),
                ),
                actions: [],
              ),
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 30, 40, 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage.memoryNetwork(
                              // here `bytes` is a Uint8List containing the bytes for the in-memory image
                              placeholder: kTransparentImage,
                              image:
                                  'https://www.publicdomainpictures.net/pictures/320000/velka/background-image.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 225,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/remove.svg',
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text("Nhập tiêu đề: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "SourceSansPro")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          // filled: true,
                          // fillColor: Colors.red,
                          hintText: 'Enter your title',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: model.editingControllerTitle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Text("Nhập nội dung: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: "SourceSansPro")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 40),
                      child: TextFormField(
                        maxLines: 10,
                        decoration: const InputDecoration(
                          hintText: 'Enter your content',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: model.editingControllerContent,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          model.addItem();
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3)),
                          child: Center(
                            child: Text("Save",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => ArticleViewModel());
  }
}
