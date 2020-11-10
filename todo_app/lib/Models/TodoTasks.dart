class ToDoTasks {
  final String name;
  bool isDone;

  ToDoTasks({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
