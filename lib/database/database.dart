import 'package:todo_record/record/todo_record.dart';
import 'package:todo_record/tag.dart';

abstract class Database {
  Future<void> saveTodoRecord(TodoRecord record, {int id = 0});

  Future<List<ContainId<TodoRecord>>> findAllTodoRecord({
    Map filter = const {},
  });

  Future<TagMap> getTapMap();

  Future<void> saveTag({required Tag tag});

  Future<void> saveFilter(
      {Map<int, bool>? priorityFilter, Map<int, bool>? tagFilter});

  Future<Map<int, bool>> getFilter(FilterType type);
}

enum FilterType { priority, tag }

class ContainId<T> {
  int id;
  T content;

  ContainId(this.id, this.content);
}

