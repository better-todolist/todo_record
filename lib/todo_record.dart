library todo_record;

import 'package:todo_record/time_representation/representation.dart';

/// Todo 事件记录
/// 在当前的TODO list 中， 只有最简单的 代办事件列表
///
/// 更强大的待办事件列表
///
/// 1. 待办事件的标签 最多32个
/// 2. 待办事件的优先级（重要程度） 1~9
/// 3. 待办事件的内部子待办
///   - 全部子待办完成后才可激活
///   - 子待办可以分组
///   - 每个子待办可以添加标签和优先级
/// 4. 待办事件的时间限度
///   1. 无限制
///   2. 有ddl
///   3. 待办事件在时间段内完成
/// 5. 待办事件的时间精度
///   -
abstract class TodoRecord{

}