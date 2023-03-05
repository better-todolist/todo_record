
import 'common.dart';

class SubRecord with Finishible, FinishRate {
  String message;

  SubRecord(this.message, {bool state = false}) {
    setState(state: state);
  }

  SubRecord.fromDict(Map map) : this(map["message"], state: map["finish"]);

  @override
  num finishRate() => isFinish() ? 1.0 : 0.0;

  @override
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

  int getFinishNum() =>
      list
          .where((element) => element.isFinish())
          .length;

  int getLength() => list.length;

  @override
  num finishRate() => getFinishNum() / getLength();

  @override
  Map toMap() {
    return {
      "groupName": title,
      "records": list.map((e) => e.toMap()).toList(),
    };
  }
}
