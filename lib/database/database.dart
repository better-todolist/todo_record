import 'package:todo_record/record/todo_record.dart';
import 'package:todo_record/tag.dart';

abstract class Database {

  Future<void> saveTodoRecord(TodoRecord record,{int id = 0});

  Future<List<TodoRecord>> findAllTodoRecord({
    Map filter = const {},
  });

  Future<TagMap> getTapMap();

  Future<void> saveTag({required Tag tag});

  Future<void> saveFilter(
      {Map<int, bool>? priorityFilter, Map<int, bool> tagFilter});

  Future<Map<int, bool>> getFilter(FilterType type);
}

enum FilterType { priority, tag }
