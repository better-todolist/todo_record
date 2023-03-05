import 'dart:ui';

import 'package:objectbox/objectbox.dart';

class SubRecord {
  String content;
  bool isFinish;

  SubRecord(this.content, [this.isFinish = false]);
}

class TodoGroup {
  String? message;
  List<SubRecord> records;

  TodoGroup({
    this.message,
    required this.records,
  });
}

@Entity()
class TodoItem {
  @Id()
  int id = 0;
  String message;
  int priority;
  List<TodoGroup> groups;
  bool isFinish;
  List<int> tags;


  TodoItem(
      {required this.message,
      required this.priority,
      required this.groups,
      required this.isFinish,
      required this.tags});
}

@Entity()
class TagInfo {
  @Id()
  int id = 0;
  int tagId;
  String content;
  Color color;

  TagInfo({required this.tagId, required this.content, required this.color});
}
