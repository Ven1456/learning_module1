import 'package:bloc/bloc.dart';
import 'package:untitled3/cubit/counter_cubit_states.dart';


class CounterCubit extends Cubit<CubitState>
{
  CounterCubit() : super(CubitState(counterValue: 0,));

  void  increment()=> emit(CubitState(counterValue: state.counterValue +1,IsIncrement: true));

  void decrement() => emit(CubitState(counterValue: state.counterValue -1,IsIncrement: false));
}