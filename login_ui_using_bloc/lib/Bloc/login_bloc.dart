import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:login_ui_using_bloc/Validators/validators_login.dart';

class Bloc extends Object with Validators implements BaseBloc
{
  final _emailController = BehaviorSubject <String>();
  final _passwordController = BehaviorSubject <String>();

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChange => _passwordController.sink.add;
  
  Stream<String> get email => _emailController.stream.transform(emailValidators);
  Stream<String>  get password => _passwordController.stream.transform(passwordValidators);


  submit()
  {
  }

 Stream<bool> get submitCheck => CombineLatestStream.combine2(email,password,(e,p)=>true);


  @override
  void dispose() {
    _emailController ?.close();
    _passwordController ?.close();
  }
}



abstract class BaseBloc
{
  void dispose();
}
//
// void ShowsuccesBar(String message)
// {
//  final snackbar = ScaffoldMessenger.of(context).showSnackBar(messege)
// }
//
// void showSuccessSnackBar(String message) {
//   final snackBar = SnackBar(
//     content: Text(
//       message,
//       textAlign: TextAlign.center,
//     ),
//     backgroundColor: Colors.white,
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }