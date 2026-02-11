class NoteModel {
  String id;
  String title;
  String content;
  DateTime createdAt;

  NoteModel({

    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Title': title,
      'Content': content,
      'CreatedAt': createdAt.toIso8601String(),
    };
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['Id'],
      title: json['Title'],
      content: json['Content'],
      createdAt: DateTime.parse(json['CreatedAt']),
    );
  }
}
