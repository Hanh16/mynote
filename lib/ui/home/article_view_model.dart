import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mynote/model/article_model.dart';
import 'package:mynote/repo/articel_repository.dart';
import 'package:stacked/stacked.dart';

/// Trạng thái của view
enum ArticleViewState { listView, itemView, insertView, updateView }

class ArticleViewModel extends BaseViewModel {
  final title = 'Note View Model';

  /// Danh sách các bản ghi được load bất đồng bộ bên trong view model,
  /// khi load thành công thì thông báo đến view để cập nhật trạng thái
  var _items = <Article>[];

  /// ### Danh sách các bản ghi dùng để hiển thị trên ListView
  /// Vì quá trình load items là bất đồng bộ nên phải tạo một getter
  /// `get items => _items` để tránh xung đột
  List<Article> get items => _items;

  /// Trạng thái mặc định của view là listView, nó có thể thay đổi
  /// bên trong view model
  var _state = ArticleViewState.listView;

  /// Khi thay đổi trạng thái thì sẽ báo cho view biết để cập nhật
  /// nên cần tạo một setter để vừa nhận giá trị vừa thông báo đến view
  set state(value) {
    // Cập nhật giá trị cho biến _state
    _state = value;

    // Thông báo cho view biết để cập nhật trạng thái của widget
    notifyListeners();
  }

  /// Cần có một getter để lấy ra trạng thái view cục bộ cho view
  ArticleViewState get state => _state;

  Article editingItem;

  var editingControllerTitle = TextEditingController();
  var editingControllerContent = TextEditingController();

  ///
  var repo = ArticleRepository();

  Future init() async {
    return reloadItems();
  }

  Future reloadItems() async {
    return repo.items().then((value) {
      _items = value;
      notifyListeners();
    });
  }

  void addItem() {
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
    var numberRandom = new Random();
    var item = Article(
        editingControllerTitle.text,
        editingControllerContent.text,
        listImage[numberRandom.nextInt(listImage.length)]);

    repo.insert(item).then((value) {
      reloadItems();
    });
  }

  void updateItem() {
    editingControllerTitle.text = editingItem.title;
    editingControllerContent.text = editingItem.image;
    state = ArticleViewState.updateView;
  }

  void saveItem() {
    editingItem = null;
    notifyListeners();
  }

  void deleteItem(item) {
    print(item.id);
    repo.delete(item);
  }
}
