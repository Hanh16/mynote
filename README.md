# My articles
Xây dựng ứng dụng My articles
(Đây là 1 ứng dụng cho phép user tạo các bài đăng nói về ý nghĩa cuộc sống, những câu châm ngôn, hay là 1 đoạn tiểu thuyết ngắn nào đó , ...)

### Các chức năng chính trong hệ thống 
- Xem danh sách các bài đăng
- Xem chi tiết nội dung của từng bài
- Đăng bài 
- Xoá bài đăng 
- Chỉnh sửa bài đăng
- Ngoài ra còn có các chức năng như tìm kiếm, thông báo,..
## My articles App UI

### Màn hình đăng nhập
![App UI](/assets/images/welcome.png)
![App UI](/assets/images/login.png)
 
### Màn hình trang chủ 
![App UI](/assets/images/home.png)



### Màn hình xem nội dung chi tiết của bài đăng 
![App UI](/assets/images/detail.png)



### Các màn hình tạo , chỉnh sửa , xoá 
![App UI](/assets/images/add.png)
![App UI](/assets/images/edit.png)
![App UI](/assets/images/edit_screen.png)



### Phần core
```dart
import 'package:flutter/material.dart';
import 'package:mynote/ui/authen/src/welcomePage.dart';
import 'package:mynote/ui/home/article._view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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
        home: WelcomePage());
  }
}
```
