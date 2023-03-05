import 'package:todo_record/record/common.dart';
import 'package:todo_record/record/sub_todo.dart';
import '../time_representation/time_limit.dart';

class TodoRecord
    with Finishible, Tagable, Priorityable, FinishRate {
  int id = 0;
  String message;
  List<SubTodoGroup> groups;
  TimeToEnd end;

  TodoRecord(this.message, {required this.end, this.groups = const []});

  TodoRecord.fromDict(Map map)
      :message = map["msg"],
        groups=(map["groups"] as List<Map>)
            .map((e) => SubTodoGroup.fromDict(e))
            .toList(),
        end = timeToEndFromMap(map["ddl"]){
    setPriority(priority: map["priority"]);
    for (var tagId in (map["tags"] as List<int>)) {
      addTag(tagId: tagId);
    }
    setState(state:map["isFinish"]);
  }

  bool canFinish() =>
      groups.every((element) => element.getFinishNum() == element.getLength());

  @override
  num finishRate() =>
      groups.map((e) => e.getFinishNum()).reduce((value, element) =>
      value += element) /
          groups.map((e) => e.getLength()).reduce((value, element) =>
          value += element);

  @override
  bool isFinish() {
    assert(canFinish());
    return super.isFinish();
  }

  @override
  Map toMap() {
    return {
      "msg": message,
      "priority": getPriority(),
      "tags": getAllTagId(),
      "ddl": end,
      "isFinish":isFinish(),
      "groups": groups.map((e) => e.toMap()).toList()
    };
  }
}
