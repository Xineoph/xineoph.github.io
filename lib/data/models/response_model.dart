class ResponseModel {
  final DateTime date;
  final String explanation;
  final String? hdurl;
  final String? type;
  final String? version;
  final String title;
  final String url;

  const ResponseModel({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.type,
    required this.version,
    required this.title,
    required this.url,
  });

  static ResponseModel fromJson(Map<String, dynamic> data) {
    return ResponseModel(
      date: DateTime.parse(data['date']),
      explanation: data['explanation'],
      hdurl: data['hdurl'],
      type: data['type'],
      version: data['version'],
      title: data['title'],
      url: data['url'],
    );
  }


}

