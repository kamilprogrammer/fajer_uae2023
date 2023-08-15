class Behaviour {
  late int id;
  late String title;
  late String body;
  late DateTime date;

  Behaviour(
      {required this.id,
      required this.title,
      required this.body,
      required this.date});

  factory Behaviour.formJson(Map<String, dynamic> json) {
    return Behaviour(
      id: json['id'],
      title: json['name'],
      body: json['body'],
      date: json['date'],
    );
  }
}
