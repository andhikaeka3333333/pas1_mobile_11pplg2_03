import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/ModelTeam.dart';

class FavoriteController extends GetxController {
  static Database? _db;
  var favorites = <TeamModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'favorite_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id INTEGER PRIMARY KEY,
            strTeam TEXT,
            strStadium TEXT,
            strBadge TEXT,
            isFavorite INTEGER
          )
        ''');
      },
    );
  }


  Future<int> addFavorite(TeamModel item) async {
    var dbClient = await db;
    int result = await dbClient!.insert('favorites', item.toMap());
    loadFavorites();
    return result;
  }


  Future<void> loadFavorites() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('favorites');
    favorites.assignAll(
      queryResult.map((data) => TeamModel.fromMap(data)).toList(),
    );
  }


  Future<void> removeFavorite(String strTeam) async {
    var dbClient = await db;
    await dbClient!.delete('favorites', where: 'strTeam = ?', whereArgs: [strTeam]);
    loadFavorites();
  }

  bool isFavorite(TeamModel item) {
    return favorites.any((favorite) => favorite.strTeam == item.strTeam);
  }


}
