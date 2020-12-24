import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynote/ui/details/NewestAdd.dart';
import 'package:stacked/stacked.dart';

import 'article_view_model.dart';
import 'item/NewestItem.dart';

class ArticleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ArticleViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
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
              ),
              body: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: model.items.length,
                itemBuilder: (BuildContext context, int index) =>
                    new Container(child: NewestItem(model.items[index], index)),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return NewestAdd();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    // elevation: 5.0,
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => ArticleViewModel());
  }
}
