import 'dart:async';
import 'dart:io';

// import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:topnews/models/post_model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  DatabaseHelper.internal();
  DatabaseHelper.post();
  factory DatabaseHelper() => _instance;

  static Database _db;

  final String postTable = 'postTable';
  final String id = 'id';
  final String postId = 'postId';
  final String postTitle = 'postTitle';
  final String postUrl = 'postUrl';
  final String postImageUrl = 'postImageUrl';
  final String postSource = 'postSource';

  Future<Database> get db async {
    return _db != null ? _db : await initDb();
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'topnewsdb.db');
    String path = join(documentsDirectory.path, 'topnewsdb.db');
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $postTable($id INTEGER PRIMARY KEY,$postId TEXT, $postTitle TEXT,$postUrl TEXT,$postImageUrl TEXT,$postSource TEXT)");
  }

  Future<int> savePost(Post post) async {
    var dbClient = await db;
    int res = await dbClient.insert('$postTable', post.toMap());
    return res;
  }

  Future<List> getAllPost() async {
    var dbClient = await db;
    var result = await dbClient.query('SELECT * FROM $postTable');
    return result;
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.query('SELECT COUNT(*) FROM $postTable'));
  }

  Future<Post> getPost(int id) async {
    var dbClient = await db;
    var result =
        await dbClient.query('SELECT * FROM $postTable WHERE $id = $id');
    return result.length == 0 ? null : new Post.fromMap(result.first);
  }

  Future<int> updatePost(Post post) async {
    var dbClient = await db;
    return dbClient
        .update(postTable, post.toMap(), where: "$id =?", whereArgs: [post.id]);
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  Future<int> deletePost(int id) async {
    var dbClient = await db;
    return dbClient.delete(postTable, where: "$id =?", whereArgs: [id]);
  }
}
