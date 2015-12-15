import 'package:tmdb/html.dart';

main() async {
  TmdbApi tmdbApi = new TmdbApi('306b27f6d4bfe68442cd66152d01a134');
  var resp = await tmdbApi.doQuery('movie/256274');
  print(resp);
  if (resp is Map) {
    print("title = ${resp['title']}");
  }
}
