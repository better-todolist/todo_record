import 'dart:ui';

import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_record/record/common.dart';
import 'package:todo_record/tag.dart';

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
      0: Tag("tag0", 0, const Color.fromARGB(1, 1, 1, 1)),
      1: Tag("tag1", 1, const Color.fromARGB(1, 1, 1, 1)),
      2: Tag("tag2", 2, const Color.fromARGB(1, 1, 1, 1)),
    });

    expect(tags, [
      Tag("tag0", 0, const Color.fromARGB(1, 1, 1, 1)),
      Tag("tag1", 1, const Color.fromARGB(1, 1, 1, 1)),
      Tag("tag2", 2, const Color.fromARGB(1, 1, 1, 1))
    ]);
  });
}

class A with Tagable {}
