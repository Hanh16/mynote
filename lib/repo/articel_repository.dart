import 'package:mynote/data/local/local_repository.dart';
import 'package:mynote/data/local/repository.dart';
import 'package:mynote/model/article_model.dart';

class ArticleRepository implements Repository<Article> {
  ArticleRepository._internal(LocalRepository localRepo) {
    this.localRepo = localRepo;
  }

  static final _cache = <String, ArticleRepository>{};

  factory ArticleRepository() {
    return _cache.putIfAbsent('NoteRepository',
        () => ArticleRepository._internal(LocalRepository.instance));
  }

  @override
  LocalRepository localRepo;

  @override
  Future<dynamic> insert(Article item) async {
    final db = await localRepo.db();
    return await db.insert(Article.tableName, item.toMap());
  }

  @override
  Future<dynamic> update(Article item) async {
    final db = await localRepo.db();
    return await db.update(Article.tableName, item.toMap(),
        where: 'id = ?', whereArgs: [item.id]);
  }

  @override
  Future<dynamic> delete(Article item) async {
    return await localRepo.db().then((db) => db
        .delete(Article.tableName, where: 'id' + ' = ?', whereArgs: [item.id]));
  }

  @override
  Future<List<Article>> items() async {
    final db = await localRepo.db();
    var maps = await db.query(Article.tableName);
    return Article.fromList(maps);
  }
}
