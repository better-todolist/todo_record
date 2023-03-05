import 'package:todo_record/time_representation/representation.dart';

enum TimeMod { deathLine, limitless }

abstract class TimeToEnd {
  TimeMod getMod();

  TimeRepresentation? getTime();

  Map toMap() {
    return {"mod": getMod().index, "time": getTime()};
  }


}

TimeToEnd timeToEndFromMap(Map map) {
  var idx = map["mod"] as int;
  switch (TimeMod.values[idx]) {
    case TimeMod.deathLine:
      return DeathLine(getTime(map["time"]));
    case TimeMod.limitless:
      return Limitless();
  }
}

class DeathLine extends TimeToEnd {
  TimeRepresentation ddl;

  DeathLine(this.ddl);

  @override
  TimeMod getMod() => TimeMod.deathLine;

  @override
  TimeRepresentation? getTime() => ddl;
}

class Limitless extends TimeToEnd {
  @override
  TimeMod getMod() => TimeMod.limitless;

  @override
  TimeRepresentation? getTime() => null;
}
