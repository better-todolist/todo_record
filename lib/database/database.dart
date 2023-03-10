import 'package:todo_record/record/todo_record.dart';
import 'package:todo_record/tag.dart';

abstract class Database {
  removeTodoRecord(int id);

  saveTodoRecord(TodoRecord record, {int id = 0});

  List<ContainId<TodoRecord>> findAllTodoRecord({
    Map filter = const {},
  });

  TagMap getTagMap();

  saveTag({required Tag tag});

  removeTag({required Tag tag});

  saveFilter({Map<int, bool>? priorityFilter, Map<int, bool>? tagFilter});

  Map<int, bool> getFilter(FilterType type);
}

enum FilterType { priority, tag }

class ContainId<T> {
  int id;
  T content;

  ContainId(this.id, this.content);
}

