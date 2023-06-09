import 'dart:async';


class Validators {
  //email validator
  var emailValidators =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("Email is not valid");
    }
  });

  var passwordValidators = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 8) {
      sink.add(password);
    } else {
      sink.addError("Password should be greater than 8");
    }
  });
}
