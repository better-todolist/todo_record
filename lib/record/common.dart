import 'package:fixnum/fixnum.dart';

import '../tag.dart';

mixin Finishible {
  bool state = false;

  setState({bool state = true}) {
    this.state = state;
  }

  finish() => setState(state: true);

  bool isFinish() => state;
}

enum Priority {
  level0,
  level1,
  level2,
  level3,
  level4,
  level5,
  level6,
  level7,
  level8,
  level9,
}

mixin Priorityable {
  Priority priority = Priority.level5;

  setPriority({Priority priority = Priority.level5}) {
    this.priority = priority;
  }

  Priority getPriority() => priority;
}

mixin Tagable {
  Int32 bitmap = Int32(0);

  addTag({required int tagId}) {
    assert(tagId >= 0 && tagId < 32);
    bitmap = bitmap | Int32((1 << tagId));
  }

  bool containTag({required int tagId}) {
    assert(tagId >= 0 && tagId < 32);
    var t = bitmap & Int32((1 << tagId));
    return t != 0;
  }

  removeTag({required int tagId}) {
    assert(containTag(tagId: tagId));
    bitmap = bitmap & Int32(~(1 << tagId));
  }

  List<int> getAllTagId() {
    List<int> tags = List.empty(growable: true);
    for (int offset = 0; offset < 32; offset++) {
      if ((bitmap) & Int32((1 << offset)) != Int32(0)) {
        tags.add(offset);
      }
    }
    return tags;
  }

  List<Tag> getAllTag({TagMap map = const {}}) {
    List<Tag> tags = List.empty(growable: true);
    for (int offset = 0; offset < 32; offset++) {
      if ((bitmap) & Int32((1 << offset)) != Int32(0)) {
        var tagInfo = map[offset];
        if (tagInfo != null) {
          tags.add(tagInfo);
        }
      }
    }
    return tags;
  }

  Int32 getBitmap() => bitmap;
}

mixin FinishRate {
  num finishRate();
}
