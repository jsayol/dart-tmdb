import 'package:tmdb/html.dart';

TMDBApi tmdb = new TMDBApi('306b27f6d4bfe68442cd66152d01a134');

// main() async {
//   Map info = await tmdb.movies.getInfo('105', append: ['trailers', 'alternative_titles']);
//   print(JSON.encode(info));
// }

getAlternativeTitles(int i) async {
  Map ret = await tmdb.movies.getAlternativeTitles('105', country: 'es');
  print(ret);
  // print("$i = ${ret['titles'][0]['title']}");
}

void main() {
  for (int i=0; i<45; i++) {
    print("Request $i...");
    getAlternativeTitles(i);
  }

  print("Loop done");
}
