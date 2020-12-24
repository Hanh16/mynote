import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:mynote/ui/home/article_view_model.dart';
import 'dart:developer';
import 'dart:math' as math;

import 'package:stacked/stacked.dart';

class NewestAdd extends StatefulWidget {
  @override
  _NewestAddState createState() => _NewestAddState();
}

class _NewestAddState extends State<NewestAdd> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleViewModel>.reactive(
        onModelReady: (model) => model.init(),
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
                  "Add",
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
                          child: SvgPicture.asset(
                            'assets/icons/photo.svg',
                            width: 70,
                            height: 70,
                          ),
                        ),
                        Column(
                          children: [
                            Text("Thêm 1 tấm ảnh ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontFamily: "SourceSansPro")),
                          ],
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
                            child: Text("Create",
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
