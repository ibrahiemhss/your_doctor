import 'dart:async';

class Articles {
  String id;
  String dr_name;
  String doctor_img;
  String specialty;
  String article_title;
  String article;
  String article_img;
  String date;

  Articles(
      {this.id,
      this.dr_name,
      this.specialty,
      this.doctor_img,
      this.article_title,
      this.article,
      this.article_img,
      this.date});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return new Articles(
      id: json['id'].toString(),
      dr_name: json['dr_name'].toString(),
      specialty: json['specialty'].toString(),
      doctor_img: json['doctor_img'].toString(),
      article_title: json['article_title'].toString(),
      article: json['article'].toString(),
      article_img: json['img_article'].toString(),
      date: json['date'].toString(),
    );
  }

  Articles.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        dr_name = map['dr_name'],
        specialty = map['specialty'],
        doctor_img = map['doctor_img'],
        article = map['article'],
        article_title = map['article_title'],
        article_img = map['article_img'],
        date = map['date'];
}

abstract class ArticlesRepository {
  Future<List<Articles>> fetchArticles();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
