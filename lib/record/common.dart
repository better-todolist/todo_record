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

mixin Priorityable {
  int priority = 5;

  setPriority({int priority = 5}) {
    assert(priority >= 1 && priority <= 9);
    this.priority = priority;
  }

  int getPriority() => priority;
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
}

mixin FinishRate {
  num finishRate();
}