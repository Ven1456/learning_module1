import 'package:login_bloc/auth/auth_repository.dart';
import 'package:login_bloc/login/login_screens/form_submission.dart';
import 'package:login_bloc/login/login_screens/login_event.dart';
import 'package:login_bloc/login/login_screens/login_state.dart';
import 'package:bloc/bloc.dart' ;

class LoginBloc extends Bloc<LoginEvent,LoginState>

{
  final AuthRepository authRepo;
  LoginBloc ({ required this.authRepo}) : super (LoginState());

  Stream<LoginState> mapEventToState (LoginEvent event)
  async *
  {
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
    }
    else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);
    }
    else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());


      try {
        await authRepo.login();
        yield state.copyWith(formStatus: SubmissionSuccess());
      }
      catch (exception) {
        yield state.copyWith(formStatus: SubmissionFailed(exception as Exception));
      }
    }
  }
}