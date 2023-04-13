abstract class SQLiteEntity {
  SQLiteEntity();
  Map<String, dynamic> toCreateMap();
  Map<String, dynamic> toUpdateMap();
}
