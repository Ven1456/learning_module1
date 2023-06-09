import '../model/todo_model.dart';

abstract class TodoState{}

class InitTodo extends TodoState{}
class LoadingTodo extends TodoState{}
class RespondTodo extends TodoState{
  final List<TodoModel> states;
  RespondTodo(this.states);

}
class ErrorTodo extends TodoState{

  final String message;
  ErrorTodo(this.message);
}