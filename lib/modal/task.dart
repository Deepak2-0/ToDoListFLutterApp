final String tableTasks = 'tasks';

class TaskFields {
  static final List<String> values = [id, task, isTaskComplete];
  static final String id = '_id';
  static final String task = 'task';
  static final String isTaskComplete = 'isTaskComplete';
}

class Task {
  String task;
  bool isTaskComplete;
  var id;
  Task({required this.task, this.isTaskComplete = false, required this.id});

  void toggleTask() {
    isTaskComplete = !isTaskComplete;
  }

  // Convert a Task into a Map as required for database. The keys must correspond to the names of the
  // columns in the database.

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task': task,
      'isTaskComplete': isTaskComplete == true ? 1 : 0,
    };
  }

  Map<String, dynamic> toJson() => {
        TaskFields.id: id,
        TaskFields.task: task,
        //converting to 0 and 1 for boolean as sqflite doesn't support boolean
        TaskFields.isTaskComplete: isTaskComplete ? 1 : 0,
        //For DateTime
        // TaskFields.time : time.Iso8601String(),
      };

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int?,
        task: json[TaskFields.task] as String,
        isTaskComplete: json[TaskFields.isTaskComplete] == 1 ? true : false,
        //For DateTime
        //time: DateTime.parse(json[TaskFields.time] as String) ,
      );

  Task copy({
    int? id,
    String? task,
    bool? isTaskComplete,
  }) =>
      Task(
          id: id ?? this.id,
          task: task ?? this.task,
          isTaskComplete: isTaskComplete ?? this.isTaskComplete);

  // Implement toString to make it easier to see information about
  // each task when using the print statement.
  @override
  String toString() {
    return 'Task{id: $id, task: $task, isTaskComplete: $isTaskComplete}';
  }
}
