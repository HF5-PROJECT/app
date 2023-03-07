class Book {
  Book(
    this.id,
    this.userId,
    this.start,
    this.end,
  );

  Book.fromJSON(Map<String, dynamic> json)
      : id = json['id'] as int,
        userId = json['userId'] as int,
        start = json['start'] as DateTime,
        end = json['end'] as DateTime;

  int id;
  int userId;
  DateTime start;
  DateTime end;
}
