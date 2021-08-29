class Task {
  String task;
  bool isTaskComplete;

  Task({required this.task, this.isTaskComplete = false});

  void toggleTask() {
    isTaskComplete = !isTaskComplete;
  }
}
