import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// a class to handle the various fields of the news item
class News {
  String? author;
  String? title;
  DateTime? datePublished;
 

  News({
    this.author,
    this.title,
    this.datePublished,
    // this.ImageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      datePublished: DateTime.parse(json['publishedAt']),
      author: json['author'],
      title: json['title'],
     
    );
  }

//fetching the list of articles from the API
  Future<List<News>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=${env['API_KEY']}'));

    Map<String, dynamic> json = jsonDecode(response.body);

    List<dynamic> body = json['articles'];
    List<News> articles =
        body.map((dynamic item) => News.fromJson(item)).toList();

    if (response.statusCode == 200) {
      //if the server returns a 200 OK response
      //return the list of articles
      return articles;
    } else {
      //if the server does not return a 200 OK response
      //throw an exception
      throw Exception('Data was not loaded');
    }
  }
}
