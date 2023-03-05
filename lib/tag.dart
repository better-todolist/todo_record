import 'dart:ui';

class Tag{
  final String msg;
  final int id;
  final Color color;
  Tag(this.msg, this.id, this.color);
}

typedef TagMap = Map<int,Tag>;