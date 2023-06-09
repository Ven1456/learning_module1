import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/time/time_states.dart';
import 'package:wakelock/wakelock.dart';

class WorkoutCubit extends Cubit<WorkoutState>{
  WorkoutCubit():super(const WorkoutInitial());

  Timer? _timer;
  onTick(Timer timer){
    if(state is WorkoutInProgress){
      WorkoutInProgress wip = state as WorkoutInProgress;
      if(wip.elapsed!< 110){
        emit(WorkoutInProgress( wip.elapsed!+1));

      }else{
        _timer!.cancel();
        Wakelock.disable();
        emit(const WorkoutInitial());
      }
    }
  }

  startWorkout( [int? index]){
    Wakelock.enable();
    if(index != null){
      emit(const WorkoutInProgress( 0));
    }else{
      emit(const WorkoutInProgress( 0));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

}