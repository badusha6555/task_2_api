class GetUser {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetUser(
      {required this.userId, this.id, required this.title, required this.body});

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'],
      body: json['body'],
    );
  }
}
