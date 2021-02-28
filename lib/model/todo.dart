class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo(
      {this.createdTime,
      this.title,
      this.id,
      this.description = '',
      this.isDone = false});
}
