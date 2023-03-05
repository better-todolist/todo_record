
import 'package:todo_record/time_representation/representation.dart';

enum TimeMod{
  deathLine,
  limitless
}

abstract class TimeToEnd{
  TimeMod getMod();
  TimeRepresentation? getTime();
}

class DeathLine extends TimeToEnd{
  TimeRepresentation ddl;

  DeathLine(this.ddl);

  @override
  TimeMod getMod() => TimeMod.deathLine;

  @override
  TimeRepresentation? getTime()=> ddl;
}

class Limitless extends TimeToEnd {
  @override
  TimeMod getMod() => TimeMod.limitless;

  @override
  TimeRepresentation? getTime() => null;
}