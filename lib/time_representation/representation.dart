import 'package:flutter/material.dart';

/// 时间表示
///
/// 1. 精确到30分钟表示
/// 2. 精确到天
/// 3. 精确到星期表示
/// 4. 精确到月表示
/// 5. 精确到年表示
abstract class TimeRepresentation {
  TimeType getType();

  DateTime getTime();

  Map toMap() {
    return {"type": getType().index, "time": getTime()};
  }
}

TimeRepresentation getTime(Map map) {
  var ty = map["type"] as int;
  var date = map["time"] as DateTime;
  switch (TimeType.values[ty]) {
    case TimeType.per30Min:
      return Per30MinTime(date);
    case TimeType.perDay:
      return PerDayTime(date);
    case TimeType.perWeek:
      return PerWeekTime(date);
    case TimeType.perMonth:
      return PerMonthTime(date);
    case TimeType.perYear:
      return PerYearTime(date);
  }
}

enum TimeType { per30Min, perDay, perWeek, perMonth, perYear }

class Per30MinTime extends TimeRepresentation {
  DateTime time;

  Per30MinTime(
    this.time,
  ) {
    var timePass = 30 - (time.minute % 30);
    time = time.subtract(Duration(minutes: timePass));
  }

  @override
  DateTime getTime() => time;

  @override
  TimeType getType() => TimeType.per30Min;
}

class PerDayTime extends TimeRepresentation {
  DateTime time;

  PerDayTime(DateTime time) : time = DateTime(time.year, time.month, time.day);

  @override
  DateTime getTime() => time;

  @override
  TimeType getType() => TimeType.perDay;
}

class PerWeekTime extends TimeRepresentation {
  DateTime time;

  PerWeekTime(DateTime time)
      : time = DateUtils.addDaysToDate(time, -time.weekday);

  @override
  DateTime getTime() => time;

  @override
  TimeType getType() => TimeType.perWeek;
}

class PerMonthTime extends TimeRepresentation {
  int year;
  int month;

  PerMonthTime(DateTime time)
      : year = time.year,
        month = time.month;

  @override
  DateTime getTime() => DateTime(year, month);

  @override
  TimeType getType() => TimeType.perMonth;
}

class PerYearTime extends TimeRepresentation {
  int year;

  PerYearTime(DateTime time) : year = time.year;

  @override
  DateTime getTime() => DateTime(year);

  @override
  TimeType getType() => TimeType.perYear;
}
