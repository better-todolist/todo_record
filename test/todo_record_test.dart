import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_record/record/common.dart';
import 'package:todo_record/record/sub_todo.dart';
import 'package:todo_record/record/todo_record.dart';
import 'package:todo_record/tag.dart';
import 'package:todo_record/time_representation/time_limit.dart';

main() {
  test("test bitmap", () {
    A a = A();
    a.addTag(tagId: 0);
    a.addTag(tagId: 1);

    expect(a.bitmap, Int32(3));

    a.removeTag(tagId: 1);
    expect(a.bitmap, Int32(1));

    expect(a.containTag(tagId: 0), true);
    expect(a.containTag(tagId: 1), false);

    a.addTag(tagId: 1);
    a.addTag(tagId: 2);

    var tags = a.getAllTag(map: {
      0: Tag(
        "tag0",
        0,
      ),
      1: Tag(
        "tag1",
        1,
      ),
      2: Tag(
        "tag2",
        2,
      ),
    });

    expect(tags, [
      Tag(
        "tag0",
        0,
      ),
      Tag(
        "tag1",
        1,
      ),
      Tag(
        "tag2",
        2,
      )
    ]);
  });

  test("test deep copy", () {
    var r = TodoRecord("A", end: Limitless(), groups: [
      SubTodoGroup("A", [SubRecord("A")])
    ])
      ..addTag(tagId: 0)
      ..addTag(tagId: 1);

    var rc = TodoRecord.deepCopy(r);

    rc.message = "B";
    rc.groups.clear();
    rc.removeTag(tagId: 1);

    expect(r.message, "A");
    expect(r.groups.length, 1);
    expect(r.containTag(tagId: 0), true);
    expect(r.containTag(tagId: 1), true);

    expect(rc.message, "B");
    expect(rc.groups.length, 0);
    expect(rc.containTag(tagId: 0), true);
    expect(rc.containTag(tagId: 1), false);
  });
}

class A with Tagable {}
