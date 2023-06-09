import 'package:bloc_cubit_api/cubit/states_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/NetworkCubit.dart';
class TodoCubit extends Cubit<TodoState>
{
  final TodoNetwork _todoNetwork;
  TodoCubit(this._todoNetwork): super(InitTodoState());

  Future<void> fetchData () async
  {
    emit(LoadingTodoState());
  try{
    final response = await _todoNetwork.accessData();
    emit(ResponseTodoState(response));
  }
  catch(e){
    emit(ErrorTodoState(e.toString()));
  }
  }

}