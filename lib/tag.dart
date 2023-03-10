class Tag {
  final String msg;
  final int id;

  Tag(
    this.msg,
    this.id,
  );

  @override
  String toString() => "Tag[$id]: $msg";

  @override
  bool operator ==(Object other) {
    if (other.runtimeType == Tag) {
      other as Tag;
      return id == other.id && msg == other.msg;
    } else {
      return false;
    }
  }

  @override
  int get hashCode => id.hashCode + msg.hashCode;
}

typedef TagMap = Map<int, Tag>;
