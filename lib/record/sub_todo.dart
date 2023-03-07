
import 'common.dart';

class SubRecord with Finishible, FinishRate {
  String message;

  SubRecord(this.message, {bool state = false}) {
    setState(state: state);
  }
  SubRecord.fromDict(Map map) : this(map["message"], state: map["finish"]);
  SubRecord.deepCopy(SubRecord rhs): this.fromDict(rhs.toMap());

  @override
  num finishRate() => isFinish() ? 1.0 : 0.0;

  Map toMap() {
    return {"message": message, "finish": isFinish()};
  }
}

class SubTodoGroup with FinishRate {
  String? title;
  List<SubRecord> list;

  SubTodoGroup(this.title, this.list);

  SubTodoGroup.fromDict(Map map) :this(map["groupName"],
      (map["records"] as List<Map>).map((e) => SubRecord.fromDict(e)).toList());

  SubTodoGroup.deepCopy(SubTodoGroup rhs):this.fromDict(rhs.toMap());

  int getFinishNum() =>
      list
          .where((element) => element.isFinish())
          .length;

  int getLength() => list.length;

  @override
  num finishRate() => getFinishNum() / getLength();

  Map toMap() {
    return {
      "groupName": title,
      "records": list.map((e) => e.toMap()).toList(),
    };
  }
}
