import 'dart:convert';

class Movie {
  String title;
  String director;
  List<String> genre;
  List<String> starring;
  String language;
  String releaseDate;
  String views;
  String vote;
  Movie({
    required this.title,
    required this.director,
    required this.genre,
    required this.starring,
    required this.language,
    required this.releaseDate,
    required this.views,
    required this.vote,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'director': director,
        'genre': jsonEncode(genre),
        'starring': jsonEncode(starring),
        'language': language,
        'releaseDate': releaseDate,
        'views': views,
        'vote': vote,
      };
}
