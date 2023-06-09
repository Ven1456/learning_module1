import 'package:cubit_practice/bloc/cubit/cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Network_cubit.dart';

class Cubit_info extends Cubit<CubitState>

{
  final CubitNetwork _cubitNetwork;
  Cubit_info(this._cubitNetwork):super(Initstate());
  Future<void> fetchData() async
  {
    emit(LoadingState());
  try{
    final response = await _cubitNetwork.FetchData();
    emit(RespondState(response));
  }
  catch(e)
    {
      emit(ErrorState(e.toString()));
    }
  }



}