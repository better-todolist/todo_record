mixin Finishible{
  bool state = false;

  finish(){state = true;}
  rev(){state != state;}

  bool is_finish() => state;
}

mixin Priorityable{
  int priority = 5;

  set_priority({int priority = 5}){
    assert(priority>=1 && priority<=9);
    this.priority = priority;
  }

  int get_priority() => priority;
}

mixin Tagable{

}