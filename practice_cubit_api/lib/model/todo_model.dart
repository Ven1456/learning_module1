class TodoModel
{
  final int userId;
  final int id;
  final String title;
  final String completed;

  TodoModel({
    required this.title,
    required this.id,
    required this.completed,
    required this.userId,
});
}