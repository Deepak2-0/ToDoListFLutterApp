class Task {
  String task;
  bool isTaskComplete;
  var id;
  Task({required this.task, this.isTaskComplete = false, required this.id});

  void toggleTask() {
    isTaskComplete = !isTaskComplete;
  }

  // Convert a Taks into a Map as required for database. The keys must correspond to the names of the
  // columns in the database.

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'isTaskComplete': isTaskComplete == true ? 1 : 0,
    };
  }

  // Implement toString to make it easier to see information about
  // each task when using the print statement.
  @override
  String toString() {
    return 'Task{id: $id, task: $task, isTaskComplete: $isTaskComplete}';
  }
}
