import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/todo_model.dart';

abstract class  CubitState{}

class Initstate extends CubitState{}

class LoadingState extends CubitState{}


class ErrorState extends CubitState{
  final String mesage;
  ErrorState(this.mesage);


}
class RespondState extends CubitState{

  final  List<CubitModel> model;
  RespondState(this.model);

}


