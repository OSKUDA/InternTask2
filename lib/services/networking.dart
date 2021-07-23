import 'package:http/http.dart' as http;
import 'package:housy_inter_task_2/model/movie.dart';

class Networking {
  Future<bool> postData(Movie movie) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://hoblist.com/movieList'),
        headers: <String, String>{
          'category': 'movies',
          'language': 'hindi',
          'genre': 'all',
          'sort': 'voting',
        },
        body: movie.toJson(),
      );
      print(response.statusCode);
      print(response.body);
      return true;
    } catch (e) {
      print('error $e');
      return false;
    }
  }
}
