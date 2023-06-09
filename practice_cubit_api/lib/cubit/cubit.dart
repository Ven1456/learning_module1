import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_cubit_api/cubit/cubit_states.dart';
import 'package:practice_cubit_api/bloc/Cubitnetwork.dart';

class TodoCubit extends Cubit<TodoState>
{
  final TodoNetwork _todoNetwork;

  TodoCubit(this._todoNetwork):super(InitTodo());
 Future<void> fetchdata()async{
   emit(LoadingTodo());

   try {
     final response= await _todoNetwork.GetData();
     emit(RespondTodo(response));

   }
   catch(e)
   {
     emit(ErrorTodo(e.toString()));
   }
 }
}