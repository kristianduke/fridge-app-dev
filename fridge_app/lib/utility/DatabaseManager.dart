import 'package:fridge_app/data/Recipe.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static const int _version = 1;
  static const String _dbName = "myIngredients.db";

  static Future<Database> _getDB() async {
    return openDatabase(join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => // On Create, Generate Database if non-existent
        await db.execute("CREATE TABLE Ingredients(ref TEXT PRIMARY KEY, amount TEXT NOT NULL, weight TEXT NOT NULL, expiryDate INTEGER NOT NULL);"),
        version: _version
    );
  }
  
  static Future<int> addRecipe(Ingredient recipe) async {
    final db = await _getDB();
    return await db.insert("Ingredients", recipe.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> removeIngredient(Ingredient recipe) async {
    final db = await _getDB();
    return await db.delete("Ingredients",
        where: 'ref = ?',
        whereArgs: [recipe.ref]
    );
  }

  static Future<List<Ingredient>?> getAllIngredients() async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db.query("Ingredients");

    if(maps.isEmpty) return null;

    return List.generate(maps.length, (index) => Ingredient.fromMap(maps[index]));
  }
}