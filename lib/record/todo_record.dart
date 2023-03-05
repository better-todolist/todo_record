import 'package:todo_record/record/common.dart';
import 'package:todo_record/record/sub_todo.dart';

import '../time_representation/time_limit.dart';

class TodoRecord with Finishible, Tagable, Priorityable, FinishRate {
  String message;
  List<SubTodoGroup> groups;
  TimeToEnd end;

  TodoRecord(this.message,
      {required this.end, this.groups = const []});

  bool canFinish() =>
      groups.every((element) => element.getFinishNum() == element.getLength());

  @override
  num finishRate() =>
      groups
          .map((e) => e.getFinishNum())
          .reduce((value, element) => value += element) /
      groups
          .map((e) => e.getLength())
          .reduce((value, element) => value += element);

  @override
  bool isFinish() {
    assert(canFinish());
    return super.isFinish();
  }
}
