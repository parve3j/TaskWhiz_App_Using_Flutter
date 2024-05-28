class Todo {
  String details;
  DateTime createDateTime, updatedDatedTime;
  String status;

  Todo({
    required this.details,
    required this.createDateTime,
    required this.updatedDatedTime,
    this.status = 'pending',
  });
}
