import 'dart:ui';

class Tag {
  final String msg;
  final int id;
  final Color color;
  Tag(this.msg, this.id, this.color);

  @override
  String toString() => "Tag[$id]: $msg";

  @override
  bool operator ==(Object other) {
    if (other.runtimeType == Tag) {
      other as Tag;
      return id == other.id && msg == other.msg && color == other.color;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => id.hashCode + msg.hashCode + color.hashCode;
}

typedef TagMap = Map<int, Tag>;
