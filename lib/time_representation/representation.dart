/// 时间表示
///
/// 1. 精确到30分钟表示
/// 2. 精确到半天 （上午，下午）
/// 3. 精确到星期表示
/// 4. 精确到月表示
/// 5. 精确到年表示
abstract class TimeRepresentation{



}






class _Accurate30Min extends TimeRepresentation{
    DateTime time;

    _Accurate30Min(this.time){
        assert(time.minute == 30);
    }

}