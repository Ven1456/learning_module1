import 'package:get/get.dart';

class TapController  extends GetxController
{
  // RxInt Value
  RxInt y =0.obs;
  RxInt get _y=> y;
  // Int Value
  int x=0;
  int get _x => x;

  int z=0;
int get _z => z;

  void Total() {
     z =x+y.value ;
     update();

  }

  void Increment() {
    x++;
    update();
    print(_x);
  }

  void Decrease()
  {
    x--;
    update();

  }
  // Y
  void IncrementY()
  {
    y.value++;
    print(y);
  }
   void DecreaseY()
   {
     y.value--;
     print(y);
   }
}

/*
int x= 4
int get _x => x;
vois increment ()

{
x++;
}
 */