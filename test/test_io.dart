import 'package:tmdb/io.dart';

main() async {
  TmdbApi tmdbApi = new TmdbApi('306b27f6d4bfe68442cd66152d01a134');
  // var resp = await tmdbApi.doQuery('movie/256274');

  // var resp1 = await tmdbApi.movies.getById('105');
  // var resp2 = await tmdbApi.movies.getById('105', language: 'es');
  // var resp3 = await tmdbApi.movies.getById('105', append: ['trailers']);
  var resp3 = await tmdbApi.movies.getById('105', language: 'es', append: ['trailers']);

  // print("resp1 = $resp1");
  // print("resp2 = $resp2");
  print("resp3 = $resp3");

  return;
}
