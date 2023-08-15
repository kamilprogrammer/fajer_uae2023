class Student {
  late int id;
  late String name;

  Student({required this.id, required this.name});

  factory Student.formJson(Map<String, dynamic> json) {
    return Student(id: json['id'], name: json['name']);
  }
}
