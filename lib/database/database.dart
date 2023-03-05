import 'package:todo_record/record/todo_record.dart';
import 'package:todo_record/tag.dart';

abstract class Database {
  Future<void> insertOrUpdateRecord(TodoRecord record);

  Future<List<TodoRecord>> findAll({Map filter = const {},});

  Future<TagMap> getTapMap();
}

