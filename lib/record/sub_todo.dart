import 'common.dart';

class SubRecord with Finishible, FinishRate {
  String message;

  SubRecord(this.message, {bool state = false}) {
    setState(state: state);
  }

  @override
  num finishRate() => isFinish() ? 1.0 : 0.0;
}

class SubTodoGroup with FinishRate {
  String? title;
  List<SubRecord> list;

  SubTodoGroup(this.title, this.list);

  int getFinishNum() => list.where((element) => element.isFinish()).length;

  int getLength() => list.length;

  @override
  num finishRate() => getFinishNum() / getLength();
}
